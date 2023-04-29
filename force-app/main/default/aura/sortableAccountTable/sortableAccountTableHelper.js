/*
* Date : 3/6/2019
* API : 45
* Source : sfdcMonkey.com
*/
({
    getAccountData : function(component,event){
        //Load the Account data from apex
        var action = component.get("c.getAccounts");
        var toastReference = $A.get("e.force:showToast");
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var accountWrapper = response.getReturnValue();
                    //Setting data to be displayed in table
                    component.set("v.accountData",accountWrapper.accountsList);
                                
            } // handel callback error 
        });
        $A.enqueueAction(action);
    },
    
    sortData : function(component,fieldName,sortDirection){
        var data = component.get("v.accountData");
        //function to return the value stored in the field
        var key = function(a) { return a[fieldName]; }
        var reverse = sortDirection == 'asc' ? 1: -1;
        
        // to handel number/currency type fields 
        if(fieldName == 'NumberOfEmployees'){ 
            data.sort(function(a,b){
                var a = key(a) ? key(a) : '';
                var b = key(b) ? key(b) : '';
                return reverse * ((a>b) - (b>a));
            }); 
        }
        else{// to handel text type fields 
            data.sort(function(a,b){ 
                var a = key(a) ? key(a).toLowerCase() : '';//To handle null values , uppercase records during sorting
                var b = key(b) ? key(b).toLowerCase() : '';
                return reverse * ((a>b) - (b>a));
            });    
        }
        //set sorted data to accountData attribute
        component.set("v.accountData",data);
    }
})