global class batchExample implements Database.Batchable<sObject> {
    
    public batchExample(){
        Set<String> setofString = new Set<String>();
        for(Support_Tier__mdt obj : [Select id,MasterLabel,DeveloperName from Support_Tier__mdt]){
            setofString.add(obj.MasterLabel);
        }
        System.debug('@@@@@@@@'+setofString);

    }
   
    global Database.QueryLocator start(Database.BatchableContext BC) {
        
        String query = 'SELECT Id,Name FROM Account';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList) {
       
        
        for(Account acc : accList)
        {        
           
            acc.Name = acc.Name + 'Algoworks';
        }
        try {
            update accList;
        } catch(Exception e) {
            System.debug(e);
        }
        
    }   
    
    global void finish(Database.BatchableContext BC) {
  }
}