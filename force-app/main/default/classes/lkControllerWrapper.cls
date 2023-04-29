public class lkControllerWrapper {
    
    @auraenabled
    public string Name{get;set;}
    
    @auraenabled
    public string Id{get;set;}
    
    public lkControllerWrapper(string a, string b){
        Name = a;
        Id = b;
    }
}