trigger createaTask on Attachment (after insert) {
    Set<Id> setofAccountId = new Set<Id>();
    List<Task> listoftask = new List<Task>();
    for(Attachment obj : Trigger.New){
        setofAccountId.add(obj.ParentId);
    }
    for(Account obj : [Select id,(Select id from Attachments) from Account where ID IN:setofAccountId ]){
        if(obj.Attachments.size() ==  1)
        {
            Task taskObject = new Task();
            taskObject.WhatId = obj.id;
            listoftask.add(taskObject);
        }
    }
    try{
        insert listoftask;
    }
    catch(Exception e){
        
    }

}