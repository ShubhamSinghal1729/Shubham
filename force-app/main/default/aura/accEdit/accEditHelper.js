({
	saveAccount : function(component, event, helper) {
		
	},
    recordUpdated : function(component, event, helper){
        var changeType = event.getParams().changeType;
		if (changeType === "CHANGED") {
            component.find("accRec").reloadRecord();
        }
    }
})