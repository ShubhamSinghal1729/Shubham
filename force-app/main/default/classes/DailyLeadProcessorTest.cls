@isTest
public class DailyLeadProcessorTest {
    @isTest
    static void executeDailyProcessor(){
        String CRON_EXP = '0 0 0 15 3 ? 2022';
        List<Lead> listofLead = new List<Lead>();
        for(Integer i = 0; i<200; i++){
            Lead leadObj = new Lead();
            leadObj.LastName = 'Test';
            leadObj.Company  = 'Test';
            listofLead.add(leadObj);
        }
        insert listofLead;
       System.schedule('ScheduledApexTest',CRON_EXP, new DailyLeadProcessor()); 
    }

}