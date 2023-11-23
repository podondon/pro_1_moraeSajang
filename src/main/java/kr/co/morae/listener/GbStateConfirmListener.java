package kr.co.morae.listener;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import kr.co.morae.emuns.GbStateEnum;
import kr.co.morae.emuns.pointReasonEnum;
import kr.co.morae.groupbuy.dao.GroupBuyDao;
import kr.co.morae.groupbuy.dto.GbStateCheckDto;

@Component 
class GbStateConfirmListener implements ApplicationListener<ContextRefreshedEvent>, DisposableBean {
	Thread thread;
	Logger log = LoggerFactory.getLogger(getClass());
	@Autowired
	GroupBuyDao gbDao;
	
	
	
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		log.info("===gbStateComfirmListener start");
		
		thread = new Thread(()->{
			while(!Thread.currentThread().isInterrupted()) {
				try {
					
					LocalDate currentDate = LocalDate.now();
					LocalDateTime nextDate = currentDate.atStartOfDay();
			        long currMillisconds = nextDate.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
			        
					//공구 완료 == 완료 날짜
					ArrayList<GbStateCheckDto> gbStateList = gbDao.checkGbState();
					log.info(gbStateList.toString());
					
					if(gbStateList.size()>0) {
						autoSettingGbState(gbStateList, currMillisconds);
					}
					
					long sleep = getTimeSleep();
					
					Thread.sleep(sleep);
				} catch (InterruptedException e) {
					
					e.printStackTrace();
					break;
				}
			}
		});
		
		thread.start();
		
	}
	
	private long getTimeSleep() {
		long curMilliseconds = System.currentTimeMillis();
		LocalDate currentDate = LocalDate.now();
        
		LocalDateTime nextDate = currentDate.atStartOfDay().plusDays(1).plusMinutes(5);
        long nextMillisconds = nextDate.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
        long sleep = nextMillisconds-curMilliseconds;
        log.info("현재 날짜: " + currentDate);
        log.info("내일 날짜: " + nextDate);
        log.info("내일 날짜: " + sleep);
        return sleep;
	}
	
	/*
	 * 공구 상태 자동 확인함수
	 * 1. 공구 모집 마감날짜 >= 현재 날짜 && 모집 인원 != 참여 인원 -> 공구 상태를 취소로 바꾼다
	 * 2. 공구 완료 날짜 <= 현재 날짜 -> 공구 상태를 완료로 바꾼다
	 */
	private synchronized void autoSettingGbState(ArrayList<GbStateCheckDto> gbStateList, long currMillisconds) {
		
		for(GbStateCheckDto dto : gbStateList) {
			
			if((dto.getFinishDate().getTime() <= currMillisconds)
					&&dto.getRecruitPeople() != dto.getJoinNum()) {
				
				gbDao.modifyGbState(dto.getGbNo(), GbStateEnum.CANCEL.getState(), "Y");
				gbDao.insertGbStateHistory(dto.getGbNo(), GbStateEnum.CANCEL.getState());
				returnPrice(dto);
			
			}else if((dto.getCompleteDate().getTime() <= currMillisconds)) {
				gbDao.modifyGbState(dto.getGbNo(), GbStateEnum.COMPLETE.getState(),"N");
				gbDao.insertGbStateHistory(dto.getGbNo(), GbStateEnum.COMPLETE.getState());
				
				int totalPrice = dto.getJoinNum()*dto.getJoinPrice();
				log.info("총 가격:"+totalPrice);
				gbDao.insertPoint(dto.getGbNo(), dto.getUserId(), totalPrice, pointReasonEnum.CALCULATE.getState());
			}
		}
	}
	
	private void returnPrice(GbStateCheckDto dto) {
		//사용자 다 가져오기
		ArrayList<String> joinUser = gbDao.getJoinUser(dto.getGbNo());
		//사용자의 히스토리에 공구 price나눠주기
		log.info("joinUser : "+joinUser.toString());
		if(joinUser.size()>0) {
			for(String userId : joinUser) {
				gbDao.insertPoint(dto.getGbNo(), userId, dto.getJoinPrice(), pointReasonEnum.CANCEL.getState());
			}
		}
	}
	@Override
	public void destroy() throws Exception {
		log.info("====== distroy thread ==========");
		 if (thread != null) {
	        thread.interrupt(); 
	     }
	}
	
	
}
