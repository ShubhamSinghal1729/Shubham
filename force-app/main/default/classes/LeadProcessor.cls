global class LeadProcessor  implements Database.Batchable<sObject>, Database.Stateful{
    
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('Select id,LeadSource from Lead');
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> listofLead = new List<Lead>();
        for(Lead leadObject : scope){
            leadObject.LeadSource = 'Dreamforce';
            listofLead.add(leadObject);
        }
        update listofLead;
    }    
    global void finish(Database.BatchableContext bc){
        
    }    
    
}