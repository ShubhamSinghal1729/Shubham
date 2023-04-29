public class app_SearchFilters {	
	  
    @AuraEnabled
    public static Map<String,List<SelectOption>> getFilterDetails(){
        Map<String,List<SelectOption>>  mapofFiltervsFilterValues = new Map<String,List<SelectOption>>();
    	for(Fintrx_Filter__c appSearchFilterObject : [Select id,Name,Fintrx_Id__c,Value__c from Fintrx_Filter__c LIMIT 49999 ]){		
    		if(mapofFiltervsFilterValues.containsKey(appSearchFilterObject.Name)){
    			mapofFiltervsFilterValues.get(appSearchFilterObject.Name).add(new SelectOption(appSearchFilterObject.Value__c, appSearchFilterObject.Fintrx_Id__c));   			
    		}
    		else{
    			mapofFiltervsFilterValues.put(appSearchFilterObject.Name,new List<SelectOption>());
    			mapofFiltervsFilterValues.get(appSearchFilterObject.Name).add(new SelectOption(appSearchFilterObject.Value__c, appSearchFilterObject.Fintrx_Id__c));   			
    		}
    	}
        System.debug('>>>>>>>>'+mapofFiltervsFilterValues);
        return mapofFiltervsFilterValues;
}
    
  @AuraEnabled
   public static void getRequiredFilter(String mapofFilters){
   	    
   	    Map<String,Object> mapofdifferentFilters = (Map<String, Object>)JSON.deserializeUntyped(mapofFilters);
   }
    public class SelectOption {
    public SelectOption(String value, String label) {
        this.value = value;
        this.label = label;
    }
    @AuraEnabled
    public String label {get;set;}
    @AuraEnabled
    public String value { get;set;}
    } 	
}