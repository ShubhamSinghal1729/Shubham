public with sharing class testScheduler implements Schedulable{
    public void execute(SchedulableContext SC) {
        TestBatch batchToFetchBasicInestor_Lst = new TestBatch();
        //Database.executeBatch(batchToFetchBasicInestor_Lst,1);
    }
    /*public static void scheduleInvestor(){
        testScheduler sch_Fetch_inv = new testScheduler();
        String sch = '0 0 0 * * * *';
        String jobId = System.schedule('Scheduling basic  for Investor Record',sch,sch_Fetch_inv);  
        System.debug('@@@ Job Id '+jobId);
    }*/
}