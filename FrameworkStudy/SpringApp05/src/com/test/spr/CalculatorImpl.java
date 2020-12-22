// CalculatorImpl.java
// - 클래스.
// - Calculator 인터페이스를 구현하는 클래스
// - 주 업무, 보조 업무가 함께 처리되는 형태로 구성
//   (AOP 기법 적용 이전)

package com.test.spr;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StopWatch;

public class CalculatorImpl implements Calculator
{
	// 상속받은 메소드 재정의를 통해
	// 주 업무(core concern) 진행(수행)을 위한 메소드 구현
	
	@Override
	public int add(int x, int y)
	{
		// 반환할 결과값
		int result = 0;
		
		// 보조 업무(cross-cutting concern) 설정
		//-- 시간 측정 및 로그 기록
		//   로그에 내 클래스 정보를 넘겨준다. 
		Log log = LogFactory.getLog(this.getClass());
		StopWatch sw = new StopWatch();
		sw.start();
		log.info("처리 시간 측정 시작 ------------------------");
		
		
		// 주 업무(core concern) 실행 내용
		result = x + y;
		System.out.printf("%d + %d = %d%n", x, y, result);
		
		
		// 보조 업무(cross-cutting concern) 처리
		sw.stop();
		log.info("처리 시간 측정 종료-------------------------");
		log.info(String.format("경과 시간 : %s/1000초", sw.getTotalTimeMillis()));
		
		// 최종 결과값 반환
		return result;
	}

	@Override
	public int sub(int x, int y)
	{
		int result = 0;
		
		Log log = LogFactory.getLog(this.getClass());
		StopWatch sw = new StopWatch();
		sw.start();
		log.info("처리 시간 측정 시작 ------------------------");
		
		
		result = x - y;
		System.out.printf("%d - %d = %d%n", x, y, result);
		
		sw.stop();
		log.info("처리 시간 측정 종료-------------------------");
		log.info(String.format("경과 시간 : %s/1000초", sw.getTotalTimeMillis()));
		
		return result;
	}

	@Override
	public int multi(int x, int y)
	{
		int result = 0;
		
		Log log = LogFactory.getLog(this.getClass());
		StopWatch sw = new StopWatch();
		sw.start();
		log.info("처리 시간 측정 시작 ------------------------");
		
		
		result = x * y;
		System.out.printf("%d * %d = %d%n", x, y, result);
		
		sw.stop();
		log.info("처리 시간 측정 종료-------------------------");
		log.info(String.format("경과 시간 : %s/1000초", sw.getTotalTimeMillis()));
		
		return result;
	}

	@Override
	public int div(int x, int y)
	{
		int result = 0;
		
		Log log = LogFactory.getLog(this.getClass());
		StopWatch sw = new StopWatch();
		sw.start();
		log.info("처리 시간 측정 시작 ------------------------");
		
		
		result = x / y;
		System.out.printf("%d / %d = %d%n", x, y, result);
		
		sw.stop();
		log.info("처리 시간 측정 종료-------------------------");
		log.info(String.format("경과 시간 : %s/1000초", sw.getTotalTimeMillis()));
		
		return result;
	}
	
}
