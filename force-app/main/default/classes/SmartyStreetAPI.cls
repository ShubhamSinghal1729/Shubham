public class SmartyStreetAPI {
    
    public Static List<String> listofDescriptions{get;set;}
    public Static Boolean showsuggestions{get;set;}
    public Static Map<String,String> mapofDescriptionsvsPlaceId;
    
    public SmartyStreetAPI(){
        showsuggestions = false;
        listofDescriptions = new List<String>();
        mapofDescriptionsvsPlaceId = new Map<String,String>();
    }
    @RemoteAction
    public static List<String> getRecords(String prefix){
        try{
        showsuggestions = false;
        listofDescriptions = new List<String>();
        mapofDescriptionsvsPlaceId = new Map<String,String>();
        Http httpObj = new Http();
        HttpRequest httpRequestObj = new HttpRequest();
        httpRequestObj.setEndpoint('https://maps.googleapis.com/maps/api/place/autocomplete/json?input='+prefix+'&key=AIzaSyDy-0Lo8jGInLmf8dad5DrAdNJ5Lh3jul0');
        httpRequestObj.setMethod('GET');
        HttpResponse httpResponseObj = new HttpResponse();
        httpResponseObj = httpObj.send(httpRequestObj);
        System.debug('@@@@@@@@'+httpResponseObj.getBody());
        System.debug('@@@@@@@@@@'+prefix);
        SmartyStreetJSON2Apex obj = SmartyStreetJSON2Apex.parse(httpResponseObj.getBody());
        for(SmartyStreetJSON2Apex.predictions predictions : obj.predictions){
            listofDescriptions.add(predictions.description);
            mapofDescriptionsvsPlaceId.put(predictions.description,predictions.place_id);
        }
        showsuggestions = true;
        System.debug('@@@@@@@listofDescriptions'+listofDescriptions);
        System.debug('@@@@@@@@@mapofDescriptionsvsPlaceId'+mapofDescriptionsvsPlaceId);
        }catch(Exception e){
            
        }
        return listofDescriptions;
    }

    // Google Maps API Place Autocomplete
    // Documentation: https://developers.google.com/places/web-service/autocomplete

    
}