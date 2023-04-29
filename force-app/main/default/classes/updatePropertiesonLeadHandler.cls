public class updatePropertiesonLeadHandler {
    
    public static void updationofLead(Set<Id> setofLeadId,Set<Id> setofPropertyId){
        Map<Id,String> mapofLeadIdvsZIPCode = new Map<Id,String>();
        Map<Id,Decimal> mapofLeadIdvsUnit = new Map<Id,Decimal>();
        Map<Id,Integer> mapofLeadIdvsCount = new Map<Id,Integer>();
        List<Lead> listofLead = new List<Lead>();
        
        for(Property__c propertyObj : [Select id,Lead__c,Units__c,ZIP_Code__c from Property__c where Lead__c IN: setofLeadId AND Id NOT IN: setofPropertyId ORDER BY ZIP_Code__c]){
            if(mapofLeadIdvsCount.containsKey(propertyObj.Lead__c)){
                if(!String.isBlank(propertyObj.ZIP_Code__c) && !String.isEmpty(propertyObj.ZIP_Code__c)){
                    if(mapofLeadIdvsZIPCode.containsKey(propertyObj.Lead__c)){
                        String zipCode = mapofLeadIdvsZIPCode.get(propertyObj.Lead__c) + ',' + propertyObj.ZIP_Code__c;
                        mapofLeadIdvsZIPCode.put(propertyObj.Lead__c,zipCode);
                    }else{
                        mapofLeadIdvsZIPCode.put(propertyObj.Lead__c,propertyObj.ZIP_Code__c);
                    }
                }
                if(propertyObj.Units__c != null){
                    if(mapofLeadIdvsUnit.containsKey(propertyObj.Lead__c)){
                        Decimal units = mapofLeadIdvsUnit.get(propertyObj.Lead__c) + propertyObj.Units__c;
                        mapofLeadIdvsUnit.put(propertyObj.Lead__c,units);
                    }else{
                        mapofLeadIdvsUnit.put(propertyObj.Lead__c,propertyObj.Units__c);
                    }
                }
                Integer counts = mapofLeadIdvsCount.get(propertyObj.Lead__c) + 1;
                mapofLeadIdvsCount.put(propertyObj.Lead__c,counts);
            }else{
                if(!String.isBlank(propertyObj.ZIP_Code__c) && !String.isEmpty(propertyObj.ZIP_Code__c))
                    mapofLeadIdvsZIPCode.put(propertyObj.Lead__c,propertyObj.ZIP_Code__c);
                if(propertyObj.Units__c != null)
                    mapofLeadIdvsUnit.put(propertyObj.Lead__c,propertyObj.Units__c);
                mapofLeadIdvsCount.put(propertyObj.Lead__c,1);
            }
        }
        for(Lead leadObj : [Select id,Properties_ZIP_Code__c,Properties_Unit__c,Properties_Count__c from Lead where Id IN: mapofLeadIdvsCount.keyset()]){
            if(mapofLeadIdvsZIPCode.containsKey(leadObj.id))
                leadObj.Properties_ZIP_Code__c = mapofLeadIdvsZIPCode.get(leadObj.id);
            else
                leadObj.Properties_ZIP_Code__c = null;
            if(mapofLeadIdvsUnit.containsKey(leadObj.id))
                leadObj.Properties_Unit__c = mapofLeadIdvsUnit.get(leadObj.id);
            else
                leadObj.Properties_Unit__c = null;
            leadObj.Properties_Count__c = mapofLeadIdvsCount.get(leadObj.id);
            listofLead.add(leadObj);
        }
        try{
            if(listofLead.size() > 0){
                update listofLead;
            }
        }
        catch(Exception e){
            
        }
    }
    
}