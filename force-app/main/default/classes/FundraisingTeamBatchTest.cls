@isTest 
public class FundraisingTeamBatchTest 
{
    static testMethod void testMethod1() 
    {
        Fundraising_Team__c obj = new Fundraising_Team__c();
        obj.Name = 'Test';
        insert obj;
        Test.startTest();
        FundraisingTeamCalculationsJob batchobj = new FundraisingTeamCalculationsJob();
        String sch = '0 0 2 * * ?'; 
        System.schedule('Test Donations', sch, batchobj);         
        Test.stopTest();
    }
}