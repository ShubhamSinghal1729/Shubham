public with sharing class ALR_UtilityCtrl {
    private static final String LEAD_CREATE = 'Create';
    private static final String LEAD_UPDATE = 'Update';
    private static final String LEAD_QUERY = 'Query';
    private static final String LEAD_UPSERT = 'Upsert';
    public static Boolean checkFieldLevelSecurity(String sObjectName,String listofField,String typeofOperation){
        List<String> listofString = new List<String>();
        listofString = listofField.split(',');
        SObjectType schemaType = Schema.getGlobalDescribe().get(sObjectName);
        if(!(schemaType.getDescribe().isDeletable()) && typeofOperation == 'delete'){
            return false;
        }
        
        Map<String, SObjectField> fields = schemaType.getDescribe().fields.getMap();
        for(String field : listofString){
            if(typeofOperation == 'query' && !(fields.get(field).getdescribe().isAccessible())){
                return false;
            }
            else if(typeofOperation == 'create' && !(fields.get(field).getdescribe().isCreateable())){
                return false;
            }
            else if(typeofOperation == 'update' && !(fields.get(field).getdescribe().isUpdateable())){
                return false;
            }          
        }
        return true;        
    }
}