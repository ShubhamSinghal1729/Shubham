public class NewCaseListController {
    
    public List<Case> getNewCases(){
        return [Select id,CaseNumber from Case where Status = 'New'];
    }

}