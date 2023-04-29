public class Attachmentsviewcontroller{
    
    public List<Account> att{get;set;}
    Public string recnamesearch{get;set;}
        public Attachmentsviewcontroller()
        {
            att=[Select a.Id,a.Name From Account a];
        }
}