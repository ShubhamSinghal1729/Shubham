@isTest
public class TestVerifyDate {
    
    @isTest
    private static void test(){
        Date d1 = Date.newInstance(1960, 2, 17);
        Date d2 = Date.newInstance(1960, 2, 17);
        VerifyDate.CheckDates(d1,d2);
        Date d3 = Date.newInstance(1960, 1, 17);
        Date d4 = Date.newInstance(1960, 2, 17);
        VerifyDate.CheckDates(d3,d4);
    }
     

}