public class 가변길이 배열{
  public static void main(String[] args){
    //2차원 이상의 배열에서 각 열의 길이를 다르게 지정해줄 수 있는 배열
    //어떤 곳에 사용할 수 있을지는 아직 잘 모르겠다. 
    
    int[][] arr = new int[3][] ; // 열 길이에 해당되는 숫자를 비워주고 선언
    arr[0] = new int[2] ; 
    arr[1] = new int[3] ; 
    arr[2] = new int[4] ; // 각각의 열을 다른 길이로 초기화 
    
    //다른 방법
    int[][] arr2 = {
      {1,2},
      {1,2,3},
      {1,2,3,4}
     } ; 
     //이런 식으로 선언과 동시에 초기화도 가능하다. 
     
     
     //출력하는 법
     // (1) 일반적인 2중 for문
     for(int i = 0 ; i< arr.length ; i++){
        for(int j = 0 ; j < arr[i].length ; j++){
          System.out.print(arr[i][j] + " ");
        }
        System.out.println(""); 
     }
     
     // (2) 향상된 for문으로 출력하기 
     
     for(int[] i : arr2){
        for(int i : j){
            System.out.print(j + " "); 
        }
        System.out.println(""); 
     }
     
  } //메인 끝.
}
