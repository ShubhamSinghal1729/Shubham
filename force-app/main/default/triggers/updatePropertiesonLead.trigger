trigger updatePropertiesonLead on Property__c (after insert,after update,before delete) {
    Set<Id> setofleadId = new Set<Id>();
    Set<Id> setofPropertyId = new Set<Id>();
    if(Trigger.isInsert || Trigger.isupdate){
        for(Property__c propertyObj : trigger.New){
            if(!String.isBlank(propertyObj.Lead__c) && !String.isEmpty(propertyObj.Lead__c)){
                if(Trigger.isUpdate && ((Trigger.oldMap.get(propertyObj.id).Units__c != Trigger.newmap.get(propertyObj.id).Units__c) || (Trigger.oldMap.get(propertyObj.id).ZIP_Code__c != Trigger.newmap.get(propertyObj.id).ZIP_Code__c) || (Trigger.oldMap.get(propertyObj.id).Lead__c != Trigger.newmap.get(propertyObj.id).Lead__c))){
                    setofleadId.add(propertyObj.Lead__c);
                    setofleadId.add(Trigger.oldMap.get(propertyObj.id).Lead__c);
                } 
                else if(Trigger.isInsert){
                    setofleadId.add(propertyObj.Lead__c);
                }
            }
        }      
    }
    else if(Trigger.isDelete){
        for(Property__c propertyObj : trigger.Old){
            if(!String.isBlank(propertyObj.Lead__c) && !String.isEmpty(propertyObj.Lead__c)){
                setofleadId.add(propertyObj.Lead__c);
                setofPropertyId.add(propertyObj.id); 
            }          
        }
    }   
    updatePropertiesonLeadHandler.updationofLead(setofleadId,setofPropertyId);
}