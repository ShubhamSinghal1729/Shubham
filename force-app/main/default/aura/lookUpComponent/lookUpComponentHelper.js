({
		hideresult : function(component, event, helper) {
	    var cmp = component.find("lookupComponent");
	    window.setTimeout(
            $A.getCallback(function() {
                if (cmp.isValid()) {
                    if(component.get("v.value") == '' || component.get("v.value") == undefined){
            	        component.set("v.displayValue",'');
                        component.set("v.searchresult",[]);
            	    }
                    $A.util.removeClass(cmp,'slds-is-open');
                    $A.util.addClass(cmp,'slds-is-closed');
                }
            }), 200
        );
	},
})