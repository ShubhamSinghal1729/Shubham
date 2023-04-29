trigger OpportunityTrigger on Opportunity (after insert,before update) {
    
    if(Trigger.isInsert){
        OpportunityTriggerHandler oppHandler = new OpportunityTriggerHandler();
        oppHandler.OpportunityPeriod(Trigger.New);  
    }  
}