@isTest
public class TestRestrictContactByName {
    
    @isTest
    private static void test(){
      Contact con = new Contact();
      con.LastName = 'INVALIDNAME';
        try{
        insert con;
        }
        catch(Exception e){
            
        }
    }
     

}