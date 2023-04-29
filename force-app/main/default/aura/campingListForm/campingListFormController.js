({
	clickCreateItem: function(component, event, helper) {
        var validCamping = component.find('campingform').reduce(function (validSoFar, inputCmp) {

            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);

        if(validCamping){

            var newCamping = component.get("v.newItem");
            
            console.log("Create expense: " + JSON.stringify(newCamping));
            
            helper.createItem(component, newCamping);
            
            var listofCamping = component.get("v.items");
            listofCamping.push(newCamping);
            component.set('v.items',listofCamping);
             
        }
          
    }
})