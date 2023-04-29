trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
    List<BatchLeadConvertErrors__c> listObj = new List<BatchLeadConvertErrors__c>();   
    for(BatchApexErrorEvent objtrigger : trigger.New){
        BatchLeadConvertErrors__c obj = new BatchLeadConvertErrors__c();
        obj.AsyncApexJobId__c = objtrigger.AsyncApexJobId;
        obj.Records__c        = objtrigger.JobScope;
        obj.StackTrace__c     = objtrigger.StackTrace;
        listObj.add(obj);
    }
    try{
        insert listObj;
    }
    catch(Exception e){
        
    }
}