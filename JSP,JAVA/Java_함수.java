Class Java_함수{

  public static void testPrint(){
    System.out.println("테스트 프린트"); 
    //static으로 만든 애들은
    //클래스명.메소드명 으로 바로 호출 가능
    //클래스 안에서는 메소드명으로 바로 호출 가능. 
  } 
  
  public void testPrint2(){
    System.out.println("테스트 프린트2"); 
  
    //static 으로 만들지 않은 메서드는 
    //인스턴스를 생성한 뒤 해당 인스턴스명.메서드명 으로 호출해야한다.
    //해당 클래스 안에서도 그렇게 인스턴스를 만들어야만 호출가능하다. 
  }
  
