## XML 설정
### beans 세팅
```
<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN 2.0//EN"
        "http://www.springframework.org/dtd/spring-beans-2.0.dtd">
```
- xml파일 아래에 이렇게 세팅
- 이후 &lt;beans> 태그로 크게 묶고 안에 &lt;bean>을 만들어준다.
  
### bean 작업
- id : 호출할 이름 (변수명)
- class : 연동시킬 객체 경로 (예 / com.itwillbs.test.PersonImpl ) 

#### &lt;property> 설정
- set메서드가 있을 경우 가능한 방식.
- name 속성에는 대입할 변수의 이름을, value에는 값을 넣어주면 된다. 

#### &lt;constructor-arg>설정
- 생성자를 사용한 방식
- value 속성에 넣어준 인자들과 일치하는 생성자를 찾아서 만들어준다. 

#### ref 속성 
- 객체를 넣어줘야하는 경우, ref를 사용해서 앞서 만든 다른 bean객체의 id를 넣는 식으로 구현 가능. 


## java 파일에서 사용

#### BeanFactory를 생성
```
BeanFactory factory = new XmlBeanFactory(new FileSystemResource("person.xml"));
```
- xml 파일 정보를 가지고 BeanFactory 객체를 생성

#### getBean() 메소드로 객체 생성 후 가져오기 
```
Person pc1 = (Person)factory.getBean("personC1");
```
- Object를 return하기 때문에 casting이 필요하다. 
  
