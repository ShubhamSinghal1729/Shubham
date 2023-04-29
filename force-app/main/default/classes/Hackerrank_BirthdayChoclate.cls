public class Hackerrank_BirthdayChoclate {
    
  //  public static Integer numberofBirthdayChoclate(Integer sizeofArray,List<Integer> listofNumber,Integer day,Integer month){
       public Hackerrank_BirthdayChoclate(){
          Integer sizeofArray  = 5;
          List<Integer> listofNumber = new List<Integer>{1,2,1,3,2};
          Integer day = 3;
          Integer month = 2;
        Integer NumberofChoclate = 0;
        Integer Sum = 0;
        if(month > sizeofArray){
         //   return 0;
        }
        else{
            for(Integer i = 0 ; i< sizeofArray- month ; i++){
                for(Integer n = i ; n < i + month; n++ ){
                    Sum +=  listofNumber[n];
                }
                System.debug('@@@@@@@'+Sum);
                if(Sum == day){
                    NumberofChoclate += 1; 
                }
                Sum = 0;
            }
       //     return NumberofChoclate;
        }     
    }
    
}