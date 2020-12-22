// CalculatorAspect
// - 보조 업무 수행 클래스.
// - 보조 업무 적용 및 주 업무 호출.

package com.test.spr;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StopWatch;	// core

// ※ Spring AOP Proxy 클래스를 설계하기 위해서
//    MethodInterceptor 인터페이스를 구현하는 크랠스로 작성한다.

public class CalculatorAspect implements MethodInterceptor
{
	// MethodInterceptor 인터페이스 메소드 재정의
	@Override
	public Object invoke(MethodInvocation method) throws Throwable
	{
		// target
		Object result = null;
		
		// 보조 업무(cross-cutting concern) 설정
		//-- 시간 측정 및 로그 기록
		Log log = LogFactory.getLog(this.getClass());
		StopWatch sw = new StopWatch();
		sw.start();
		log.info("처리 시간 측정 시작 --------------------------------");
		
		// 주 업무(core concern) 실행 내용
		//-- 주 업무 실행 내용 호출
		result = method.proceed();
		
		// 보조 업무(cross-cutting concern) 처리
		sw.stop();
		log.info("처리 시간 측정 종료 --------------------------------");
		log.info(String.format("경과 시간 : %s/1000초", sw.getTotalTimeMillis()));
		
		
		
		return result;
	}

}
