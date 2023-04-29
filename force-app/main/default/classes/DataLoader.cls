public with sharing class DataLoader {
    
    @AuraEnabled(cacheable=true)
    public static List<String> getObjList(){
        List<Schema.SObjectType> objList = Schema.getGlobalDescribe().Values();     
        List<String> listofname = new List<String>();     
        for(Schema.SObjectType obj : objList)
        {
            listofname.add(obj.getDescribe().getLabel() + ' ('  + obj.getDescribe().getName() + ')');
        }
        
        listofname.sort();
       
        return listofname;
    }
    
    @AuraEnabled 
    public static List<String> getObjectFields(String selectedObj ) {
        List<String> fieldNames = new List<String>();
        if(!String.isBlank(selectedObj)){
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType ObjSchema = schemaMap.get(selectedObj);
            Map<String, Schema.SObjectField> fieldMap = ObjSchema.getDescribe().fields.getMap();
            for (String fieldName: fieldMap.keySet()) 
            {  
                fieldNames.add(fieldName);
            }
        }
        fieldNames.sort();
        return fieldNames;
    }  
    
    @AuraEnabled
    public static void Exportdata(String query){
        
    }
    
   
}