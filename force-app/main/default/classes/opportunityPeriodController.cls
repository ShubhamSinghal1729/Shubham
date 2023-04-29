public class opportunityPeriodController {
  /*
    public List<Opportunity_Period__c> opportunityPeriodList{get;set;}
    public opportunityPeriodController() {
           this.opportunityPeriodList = new List<Opportunity_Period__c>();
    }
    @AuraEnabled
    public static List<Opportunity_Period__c> getOpportunityPeriod(String opportunityId){
        List<Opportunity_Period__c> listofOpportunityPeriod = new List<Opportunity_Period__c>([Select Id,CurrencyIsoCode,Start_Date__c,End_Date__c,Straight_line_Revenue__c,Projected_Revenue__c,
        Preserve_Projected_Revenue__c from Opportunity_Period__c where Opportunity__c = :opportunityId]);
        return listofOpportunityPeriod;
    }
    @AuraEnabled (cacheable=true)
    public static Decimal getTotalProjectedRevenue(String opportunityId){
        Decimal totalProjectedRevenue = 0;
        for(Opportunity_Period__c opportunityPeriod : [Select Id,Start_Date__c,End_Date__c,Straight_line_Revenue__c,Projected_Revenue__c,
        Preserve_Projected_Revenue__c from Opportunity_Period__c where Opportunity__c = :opportunityId]){
            totalProjectedRevenue = totalProjectedRevenue + opportunityPeriod.Projected_Revenue__c;         
        }
       return  totalProjectedRevenue;
    }
    @AuraEnabled
    public static List<Opportunity_Period__c> updateOpportunityPeriodList(List<Opportunity_Period__c> listofOppPeriod){
        System.debug('@@@@@@@'+listofOppPeriod);
        update listofOppPeriod;
        System.debug('@@@@@@@'+listofOppPeriod);
        return listofOppPeriod;
        
    }
    */
}