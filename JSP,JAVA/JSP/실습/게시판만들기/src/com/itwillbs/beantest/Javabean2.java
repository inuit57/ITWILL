package com.itwillbs.beantest;

public class Javabean2 {

	private String id; 
	private String pwd;
	private int age;
	
	public Javabean2() {
		// TODO Auto-generated constructor stub
	
	}
	
	@Override
	public String toString() {
		return "Javabean2 [id=" + id + ", pwd=" + pwd + ", age=" + age + "]";
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	} 
}
