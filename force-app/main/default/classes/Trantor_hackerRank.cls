public class Trantor_hackerRank {
    Integer aliceNumber;
    Integer bobNumber;
    List<Integer> listofCompare;
    public Trantor_hackerRank(){
        aliceNumber = 0;
        bobNumber = 0;
        listofCompare = new List<Integer>();
    }
    
    public List<Integer> Trantor_compareTriplet(List<Integer> aliceProblem,List<Integer> bobProblem){
        
        for(Integer i =0 ; i<3 ; i++){
            if(aliceProblem[i] > bobProblem[i] ){
                aliceNumber = aliceNumber + 1;
            }
            else if(aliceProblem[i] < bobProblem[i]){
                bobNumber = bobNumber + 1;
            }
        }
        listofCompare.add(aliceNumber);
        listofCompare.add(bobNumber);
        return listofCompare;
    }
}