@isTest
public class LeadProcessorTest {
    
    @isTest
    static void leadProcessormethod(){
        List<Lead> listofLead = new List<Lead>();
        for(Integer i=0; i<200; i++){
            Lead leadObject = new Lead();
            leadObject.LastName = 'Test';
            leadObject.Company = 'Test';
            listofLead.add(leadObject);
        }
        insert listofLead;
        Test.startTest();
        Database.executeBatch(new LeadProcessor());
        Test.stopTest();    
    }  
}