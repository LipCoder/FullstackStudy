// Main.java
// - 클래스.
// - main() 메소드가 포함된 테스트 클래스.

package com.test.spr;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main
{
	public static void main(String[] args)
	{
		// 주 업무 실행에 대한 테스트
		// (Spring AOP 기법 적용 후)
		
		// 스프링 컨테이너에 환경 설정 파일 전달~!!!
		ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
		
		// 보조 업무와 결합한 형태로 업무 처리
		Calculator cal = context.getBean("proxy", Calculator.class);
		
		// 업무 실행 테스트
		int add = cal.add(10,  20);
		System.out.println(add);
		
		int sub = cal.sub(10,  20);
		System.out.println(sub);
		
		int multi = cal.multi(10,  20);
		System.out.println(multi);
		
		int div = cal.div(10,  20);
		System.out.println(div);
	}
}
