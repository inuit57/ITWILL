package com.itwillbs.test;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;

public class ItwillbsTest {

	public static void main(String[] args) {
		//강한 결합 
		ItwillbsImpl impl = new ItwillbsImpl(); 
		impl.setStudent(new PersonImpl("홍길동", 20));
		impl.study(); //nullpointer exception error
		
		//약한 결합을 통한 의존 주입 
		BeanFactory factory = new XmlBeanFactory(new FileSystemResource("person.xml"));
		Itwillbs itwillbs = (Itwillbs) factory.getBean("itwillP1");
		itwillbs.study();
		
	}

}
