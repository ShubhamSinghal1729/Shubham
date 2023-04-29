public with sharing class FundraisingTeamBatch implements Database.Batchable<SObject>,Database.Stateful{
    
    
    public Database.QueryLocator start(Database.BatchableContext ctx){
        return Database.getQueryLocator([SELECT Id,Contact__c,Organization__c,Start_Date__c,End_Date__c,Type__c,
                                         Previous_Year_Donations__c FROM Fundraising_Team__c]);
    }
    
    public void execute(Database.BatchableContext ctx, List<Fundraising_Team__c> records){
        Date todayDate = System.today();
        Date currentYearStart = date.newinstance(System.Today().year(), 1, 1);
        Date PreviousYearStart = date.newinstance(System.Today().year() - 1, 1, 1);
        List<Fundraising_Team__c> listtoUpdate = new List<Fundraising_Team__c>();
        
        for(Fundraising_Team__c obj : records){
            Decimal previousYearDonation = 0;
            if(obj.Type__c != 'Primary' || obj.Start_Date__c > todayDate || obj.End_Date__c < todayDate){
                obj.Previous_Year_Donations__c = 0;
            }else{
                for(Opportunity oppObj : [Select id,Amount,(Select id from OpportunityContactRoles where Role = 'Donor' OR Role = 'Soft Credit') from Opportunity where CloseDate < :currentYearStart AND CloseDate > :PreviousYearStart AND StageName = 'Closed Won' AND ((ContactId != null AND ContactId = :obj.Contact__c) OR (AccountId != null AND AccountId = :obj.Organization__c))]){
                    if(oppObj.Amount != null){
                        previousYearDonation = previousYearDonation + oppObj.Amount ;
                    }             
                }
                obj.Previous_Year_Donations__c = previousYearDonation;
            }
            listtoUpdate.add(obj);
        }
        Database.update(listtoUpdate, false);
    }
        
        public void finish(Database.BatchableContext ctx){
            
        }
    }