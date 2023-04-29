public with sharing class CampingListController {
    @AuraEnabled
    public static List<Camping_Item__c> getItems() {
        // Perform isAccessible() checking first, then
        
         String[] fieldsToCheck = new String[] {
            'Id', 'Name', 'Packed__c', 'Price__c', 'Quantity__c'
        };
        
        Map<String,Schema.SObjectField> fieldDescribeTokens = 
            Schema.SObjectType.Camping_Item__c.fields.getMap();
        
        for(String field : fieldsToCheck) {
            if( ! fieldDescribeTokens.get(field).getDescribe().isAccessible()) {
                throw new System.NoAccessException();
            }
        }
        
        return [SELECT Id, Name, Packed__c, Price__c, Quantity__c FROM Camping_Item__c];
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c campingItem) {
        // Perform isUpdatable() checking first, then
        upsert campingItem;
        return campingItem;
    }
}