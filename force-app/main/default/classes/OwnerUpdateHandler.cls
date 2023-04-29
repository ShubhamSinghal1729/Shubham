public class OwnerUpdateHandler {
    
    public static void updateOwneroflead(List<Lead> listoflead){
        Map<String,List<Lead>> mapofComapnyvsLeads = new Map<String,List<Lead>>();
        for(Lead leadObj :listoflead){
            if(mapofComapnyvsLeads.containsKey(leadObj.Company)){
                mapofComapnyvsLeads.get(leadObj.Company).add(leadObj);
            }else{
                mapofComapnyvsLeads.put(leadObj.Company,new List<Lead>());
                mapofComapnyvsLeads.get(leadObj.Company).add(leadObj);
            }
        }
        Map<String,Id> mapofComapnyvsOwnerId = new Map<String,Id>();
        for(Account accountObj : [Select id,Name,(Select id,
                                                  OwnerId from Opportunities 
                                                  where StageName = 'Closed Won' ORDER BY CREATEDDATE DESC LIMIT 1)
                                  from Account where Name IN: mapofComapnyvsLeads.keyset() ORDER BY CREATEDDATE DESC]){
                                      if(accountObj.Opportunities.size() > 0){
                                          mapofComapnyvsOwnerId.put(accountObj.Name,accountObj.Opportunities[0].OwnerId);
                                              }                                      
                                  }
        for(Lead leadObj :listoflead){
            if(mapofComapnyvsOwnerId.Containskey(leadObj.Company)){
                leadObj.OwnerId = mapofComapnyvsOwnerId.get(leadObj.Company);
            }
        }
        
    }
}