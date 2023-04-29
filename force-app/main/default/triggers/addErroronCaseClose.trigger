trigger addErroronCaseClose on Case (before update) {
    Set<Id> setofCaseId = new Set<Id>();
    Set<Id> setofOpencaseId = new Set<Id>();
    for(Case caseObject : trigger.new){
        setofCaseId.add(caseObject.id);
    }
    for(Case caseObject : [Select id,ParentId from Case where ParentId IN: setofCaseId AND Status != 'Closed']){
        setofOpencaseId.add(caseObject.ParentId);
    }
    for(Case caseObject : trigger.new){
        if(setofOpencaseId.contains(caseObject.id))
            caseObject.addError('This case can not be Closed as it conatins a Open case');
    }
}