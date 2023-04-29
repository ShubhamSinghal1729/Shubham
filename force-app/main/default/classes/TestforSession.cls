public class TestforSession {
    public List<Account> listofAccountList{get;set;}
    public TestforSession(){
        listofAccountList = new List<Account>();
        listofAccountList = [Select id,Name from Account LIMIT 49999];
        
        
    }
    public void testforDebug(){
        System.debug('>>>>>>>>>>'+listofAccountList);
    }

}