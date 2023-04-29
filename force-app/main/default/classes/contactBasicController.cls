public with sharing class contactBasicController { 
    
    @AuraEnabled
    public static wrapperofBasicData listofBasicData(){
        
        List<Contact> listofContactObject = new List<Contact>();
        Integer totalnumberofContacts = [Select Count() from Contact]; 
        Integer sizeofList = totalnumberofContacts/10;
        if(sizeofList*10<totalnumberofContacts){
            sizeofList = sizeofList + 1;
        }
        Integer minimumPageNumber = 1;
        Integer maximumPageNumber = 50;
        listofContactObject = [Select FirstName,LastName from Contact LIMIT 500 ]; 
        wrapperofBasicData basicDataWrapper = new wrapperofBasicData(listofContactObject,sizeofList,minimumPageNumber,maximumPageNumber);       
        return basicDataWrapper;
        
    }
    
    @AuraEnabled 
    public static wrapperofBasicData listofdynamicData(Integer currentPageNumber){
        
        System.debug('>>>>>>>>>>>>'+currentPageNumber);
        Integer var = Integer.valueof(currentPageNumber);
        System.debug('>>>>>>>>>>>>var'+var);
        System.debug('>>>>>>>>>>>>var'+var/50);
        List<Contact> listofContactObject = new List<Contact>();
        Integer offsetvalue = var/50;
        Integer minimumPageNumber = 50*(offsetvalue);
        minimumPageNumber = minimumPageNumber + 1;
        Integer maximumPageNumber = ((offsetvalue*50 + 1))*50;
        offsetvalue         = offsetvalue*500;
        listofContactObject = [Select FirstName,LastName from Contact LIMIT 500  OFFSET :offsetvalue ];
        System.debug('>>>>>>>>>>>>listofContactObject'+listofContactObject);
        wrapperofBasicData basicDataWrapper = new wrapperofBasicData(listofContactObject,1,minimumPageNumber,maximumPageNumber);       
        return basicDataWrapper;
   
    }
    
    public class wrapperofBasicData{
        @AuraEnabled public List<Contact> listofContact;
        @AuraEnabled public Integer size;
        @AuraEnabled public Integer minimumPage;
        @AuraEnabled public Integer maximumPage;
        public wrapperofBasicData(List<Contact> listofContactObject,Integer sizeofList,Integer minimumPageNumber,Integer maximumPageNumber){
            listofContact =  listofContactObject;
            size          =  sizeofList;
            minimumPage   =  minimumPageNumber;
            maximumPage = maximumPageNumber;
        }
    }  
}