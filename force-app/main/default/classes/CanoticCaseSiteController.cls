public class CanoticCaseSiteController {
    public String test{get;set;}
    public CanoticCaseSiteController(){
        test = 'ddd';
        test = ApexPages.currentPage().getParameters().get('id');
     System.debug('@@@@@@@@@'+ApexPages.currentPage().getParameters().get('id'));
    }

}