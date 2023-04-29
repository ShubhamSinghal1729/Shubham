public with sharing class AccountController1 {
@AuraEnabled(cacheable=true)
public static List<Account> getAccountList() {
/*  return [
    SELECT Name, AnnualRevenue, Industry
    FROM Account
    WITH SECURITY_ENFORCED
    ORDER BY Name
]; */
throw new AuraHandledException('Forced error');
}
}