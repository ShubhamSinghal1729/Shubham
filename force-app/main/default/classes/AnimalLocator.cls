public class AnimalLocator {
    public static String getAnimalNameById(Integer id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');	
        HttpResponse response = http.send(request);
        String responseString = 'trailhead';
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Object animals = (Object) results.get('animals');
            System.debug('@@@@@@@@@@'+animals);
          //  responseString =  (String)animals.get('name');
           
        }
        
       
        return responseString;
        
    }
}