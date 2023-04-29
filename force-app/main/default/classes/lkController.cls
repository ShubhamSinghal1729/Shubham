public class lkController
{
    public static map<string,map<id,sobject>> mapObjectNameRecord =new map<string,map<id,sobject>>(); 
    public static List<account> lstAccount=[select id, Name from account limit 50000];
    public static map<id,account> mapAccounts = new map<id,account>(lstAccount);
    
    public static void getObjectData(string objName, string qField){
        string s = 'select id, '+qField+' from '+ objName +' limit 50000';
        system.debug('===database Query==='+s);
        List<sobject> lstSobject = database.query(s);
        map<id,sobject> mapIdObject= new map<id,sobject>(); 
        for(sobject o: lstSobject){
            mapIdObject.put(o.Id, o);
        }
        if(!mapObjectNameRecord.containsKey(objName)){
            mapObjectNameRecord.put(objName, mapIdObject);
        }        
    }
    
    @AuraEnabled
    public static lkControllerWrapper getrecordFromId(string objName, string rId,string qField) {
        //string s = 'select id,'+qField+' from '+objName+' where id=\''+rId+'\' limit 1';
        //system.debug('===database Query==='+s);
        //sobject o = database.query(s);
        //lkControllerWrapper result = new lkControllerWrapper((string)o.get(qField),(string)o.get('Id'));
        //return result;
        system.debug('Testtttttttttt'+objName+''+rId+''+qField);
        if(objName!='account' && objName!='Account' && objName!='ACCOUNT' ){
            
            string s = 'select id,'+qField+' from '+objName+' where id=\''+rId+'\' limit 1';
            system.debug('===database Query==='+s);
            sobject o = database.query(s);
            lkControllerWrapper result = new lkControllerWrapper((string)o.get(qField),(string)o.get('Id'));
            return result;
            
        }
        else{
            if(mapAccounts.containsKey(rId)){
                sobject o = mapAccounts.get(rId);
                lkControllerWrapper result = new lkControllerWrapper((string)o.get(qField),(string)o.get('Id'));
                return result;                
            }
            else{
                string s = 'select id,'+qField+' from '+objName+' where id=\''+rId+'\' limit 1';
                system.debug('===database Query==='+s);
                if(String.isNotBlank(s)){
                	sobject o = database.query(s); 
                    lkControllerWrapper result = new lkControllerWrapper((string)o.get(qField),(string)o.get('Id'));
                	return result;
                }
                return null;                
            }
        }
    }
   
   /* @auraenabled
    public static list<lkControllerWrapper> sobjResult(string searchtext,string sobj,string qField){
        string q = 'select id,'+qField+' from '+ sobj + ' where '+ qField+' like \'%'+searchtext+'%\' +limit 20';
        List<sobject> lso = database.query(q);
        List<lkControllerWrapper> result = new List<lkControllerWrapper>();
        for(sobject o : lso){
            result.add(new lkControllerWrapper((string)o.get(qField),(string)o.get('Id')));
        }  
        return result;
    }*/
    
    @auraenabled  
    public static list<lkControllerWrapper> sobjResult1(string searchtext,string sobj,string qField, string fixField, string fixFieldValue, string revCategoryId){
        System.debug('TestrevCategoryId '+revCategoryId);
        string q = '';
        if(fixField != '' && fixFieldValue != '' && fixField != null && fixFieldValue != null && sobj != 'Product__c'){
            q = 'select id,'+qField+' from '+ sobj + ' where status__c=\'Active\' and  '+qField+' like \'%'+searchtext+'%\' and '+fixField+'=\''+fixFieldValue+'\' limit 20';
        }else if(sobj != 'Product__c'){
            q = 'select id,'+qField+' from '+ sobj + ' where status__c=\'Active\' and  '+qField+' like \'%'+searchtext+'%\' limit 20';
        }
        System.debug('Testall '+revCategoryId+' '+sobj);
        if(String.isNotBlank(revCategoryId) && String.isNotBlank(sobj) && sobj == 'Product__c'){
            q = 'select id,'+qField+' from '+ sobj + ' where status__c !=\'Invalid\' and Revenue_Category__c =\''+revCategoryId+'\' and '+qField+' like \'%'+searchtext+'%\' limit 20';
        }
        List<sobject> lso = database.query(q);
        List<lkControllerWrapper> result = new List<lkControllerWrapper>();
        for(sobject o : lso){
            result.add(new lkControllerWrapper((string)o.get(qField),(string)o.get('Id')));
        }  
        return result;
    }
    
}