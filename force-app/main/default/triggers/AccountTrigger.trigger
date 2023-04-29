trigger AccountTrigger on Account (after insert) {
    
    for(Account a:Trigger.new) {
        AccountTriggerHandler.createAccount(a.name);
    } 
}