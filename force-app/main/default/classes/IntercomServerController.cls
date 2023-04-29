public class IntercomServerController {
    @AuraEnabled    
    public static JSON2Apex getfromJSON(){
      /*  Http httpObject = new Http();
        HttpRequest httpRequestObject = new HttpRequest();
        httpRequestObject.setEndpoint('https://api.intercom.io/users');
        httpRequestObject.setMethod('GET');
        httpRequestObject.setHeader('Authorization', 'Bearer dG9rOjA2ZDQ1NTgzX2U4ZWJfNGQzMl9iOGM4X2U1ZTcxMTk1ZmY5ODoxOjA=');
        httpRequestObject.setHeader('Accept','application/json');
        HttpResponse httpResponseObject = new HttpResponse();
        httpResponseObject =  httpObject.send(httpRequestObject); */
        String json = '{"pages": { "type": "pages", "next": null, "page": 1, "per_page": 50, "total_pages": 1  }, "total_count": 1, "limited": false, "type": "user.list","users": [{"type": "user",  "id": "5bfdc2d92590c1882b865123","user_id": "123", "anonymous": false,  "email": "example@example.com","phone": null	,"name": "John Doe","pseudonym": null,"avatar": {"type": "avatar","image_url": null},"app_id": "hqm0ghyi", "companies": {"type": "company.list","companies": [] },"location_data": {"type": "location_data","city_name": "Berlin","continent_code": "EU","country_name": "Germany","postal_code": "13503","region_name": "Land Berlin","timezone": "Europe/Berlin","country_code": "DEU","latitude": 52.6122,"longitude": 13.2488},"last_request_at": 1559409052,"created_at": 1543357145,"remote_created_at": 1234567890,"signed_up_at": 1234567890,"updated_at": 1559409053,"session_count": 2,"social_profiles": {"type": "social_profile.list","social_profiles": []},"owner_id": null,"unsubscribed_from_emails": false,"marked_email_as_spam": false,"has_hard_bounced": false,"tags": {"type": "tag.list","tags": []},"segments": {"type": "segment.list","segments": []},"custom_attributes": {},"referrer": null,"utm_campaign": null,"utm_content": null,"utm_medium": null,"utm_source": null,"utm_term": null,"do_not_track": null,"last_seen_ip": null,"user_agent_data": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36"}]} ';
        JSON2Apex obj = JSON2Apex.parse(json);
        return obj;
    }
    
}