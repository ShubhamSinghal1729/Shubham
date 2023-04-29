@isTest
global class AnimalLocatorMock  implements HttpCalloutMock{
    
    global HttpResponse respond(HTTPRequest request){
        HttpResponse obj = new HttpResponse();
        obj.setBody('{"animals": {"id": 0,"name": "","eats": "","says": ""}}');
        obj.setStatusCode(200);
        return obj;
        
    }

}