public class TestBatch implements Database.Batchable<sObject>,Database.AllowsCallouts,Database.Stateful {
    public Database.QueryLocator start(Database.BatchableContext BC){ 
        String query = 'select id,Name from Account where Id = \'fdfdfg\'';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext BC, List<Account> scope){
       
    }
    public void finish(Database.BatchableContext BC){
    }
}