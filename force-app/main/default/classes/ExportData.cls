public class ExportData implements Database.Batchable<sObject>, Database.Stateful {
   
    public String query;
    public String csvColumnHeader;
    public List<String> csvRowValues = new List<String>();
    
    public ExportData(String query, List<String> csvRowValues){
        this.query = query;
    }
   
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
   
    public  void execute(Database.BatchableContext BC, List<sObject> scope){
        //Process retrieved SetupAuditTrail records and format field values.
        for(SetupAuditTrail currSetupAudit : (List<SetupAuditTrail>) scope){
            String formattedDate = currSetupAudit.CreatedDate.format('M/d/yyyy h:mm:ss a z');
            String userName = currSetupAudit.CreatedBy.Username != null ? currSetupAudit.CreatedBy.Username : '';
            String displayVal = currSetupAudit.Display != null ? String.valueOf(currSetupAudit.Display).escapeCsv() : '';
            String sectionVal = currSetupAudit.Section != null ? currSetupAudit.Section : '';
            String delegateUser = currSetupAudit.DelegateUser != null ? currSetupAudit.DelegateUser : '';
           
            String rowStr = formattedDate + ',' + userName + ',' + displayVal + ',' + sectionVal + ','+ delegateUser;
            csvRowValues.add(rowStr);
        }
    }
   
    public void finish(Database.BatchableContext BC){
        List<Folder> folders = [SELECT Id, Name FROM Folder WHERE Name = 'Setup Audit Trail Logs'];
       
        if(!folders.isEmpty()){
            String documentName = 'SetupAuditTrailLog-'+ Datetime.now().format('MMM') + Datetime.now().year();
            csvColumnHeader = 'Date, User, Action, Section, Delegate User\n';
            String csvFile = csvColumnHeader + String.join(csvRowValues,'\n');
           
            // Insert the generated CSV file in Document object under "Setup Audit Trail Logs".
            Document doc = new Document(Name = documentName, Body = Blob.valueOf(csvFile), FolderId = folders[0].Id, Type = 'csv', ContentType='application/vnd.ms-excel');
            insert doc;
        }
    }
}