public class APItoupdateOpportunity {
    
    @AuraEnabled
    public static OpportunityResponse getOpportunities(){
        String clientId = '3MVG9n_HvETGhr3AYnWpIcXxU212UCKqxsL7MOrtRMt_tGutZhEsZU2XN2kgqAsr_Ps_228_khkgDXCYTaQst';
        String clientsecret = '5381EA60073D22E16771CEFFE6452576BDFADA0563B80851A059AE5C5947D258';
        String username = 'shubham.singhal@einstein.com';
        String password = 'Sapient@12345EmyAajNVY3dfT2sKOG8oTTBJ';
        String insatnceurl = '';
        String accesstoken = '';
        Http httpObj = new Http();
        HttpRequest htppRequestObj = new HttpRequest();
        htppRequestObj.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        htppRequestObj.setMethod('POST');
        htppRequestObj.setBody('grant_type=password&client_id='+clientId+'&client_secret='+clientsecret+'&username='+username+'&password='+password);        
        HttpResponse htppResponseObj = httpObj.send(htppRequestObj);
        accesstoken token = (accesstoken)JSON.deserialize(htppResponseObj.getBody(), accesstoken.class);
        System.debug('@@@@@@@@@@@@@'+htppResponseObj.getBody());
        htppRequestObj = new HttpRequest();
        htppRequestObj.setHeader('Authorization', 'Bearer ' + token.access_token);
        String query = 'SELECT+';
        for(Field_Mapping_Opportunity__mdt obj : [Select id,Label,Conversant_Field__c from Field_Mapping_Opportunity__mdt]){
            query = query + obj.Conversant_Field__c+ ',';
        }
        query = query.removeEnd(',');
        query = query + '+from+Opportunity';
        
        htppRequestObj.setEndpoint(token.instance_url + '/services/data/v50.0/query/?q='+query);
        htppRequestObj.setMethod('GET');
        htppResponseObj = httpObj.send(htppRequestObj);
        OpportunityResponse response = (OpportunityResponse)JSON.deserialize(htppResponseObj.getBody(), OpportunityResponse.class);
        System.debug('@@@@@@@@@@@@@'+response+'@@@@@@'+htppResponseObj.getBody());
        return response;
    }    
}