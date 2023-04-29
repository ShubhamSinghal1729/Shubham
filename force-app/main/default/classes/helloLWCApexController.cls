public with sharing class helloLWCApexController {
    @AuraEnabled(cacheable=true)
    public static List<Account> findAccounts(String searchKey){
        String Key = '%' + searchKey + '%';
        return [SELECT Id, Name, AccountNumber FROM Account WHERE Name LIKE :key  LIMIT 10];      
    }

}