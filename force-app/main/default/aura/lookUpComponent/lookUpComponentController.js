({
	doInit : function(component, event, helper) {
        var f1 = component.find("entryFormview");
        var f2 = component.find("entryFormbackdrop");
        $A.util.removeClass(f1,'slds-fade-in-open');
        $A.util.removeClass(f2,'slds-backdrop--open');
        $A.util.addClass(component.find("loading"),'hideStuff');
        $A.util.addClass(component.find("ajaxRequest"),'slds-hide');
        $A.util.addClass(component.find("inputBar"),'slds-show');
        $A.util.addClass(component.find("outputBar"),'slds-hide');
        if(component.get("v.value")){ 
            component.set("v.disabledInputText",true);
            var serverAction = component.get("c.getrecordFromId");
            serverAction.setParams({ objName : component.get("v.sobject") , rId : component.get("v.value"), qField : component.get("v.queryField")});
            serverAction.setCallback(this, function(response) {
                $A.util.addClass(component.find("ajaxRequest"),'slds-hide');
                var returendResult = response.getReturnValue();
                if(returendResult!= null){
                    component.set("v.displayValue",returendResult['Name']);
                    component.set("v.value",returendResult['Id']);
                    component.set("v.oldValue",returendResult['Id']);
                    $A.util.addClass(component.find("inputBar"),'slds-hide');
                    $A.util.removeClass(component.find("inputBar"),'slds-show');
                    $A.util.addClass(component.find("outputBar"),'slds-show');
                    $A.util.removeClass(component.find("outputBar"),'slds-hide');
                    $A.util.removeClass(component.find("selectionButton"),'slds-button--neutral');
                    
                    
                    var compEvent = component.getEvent("lookUpEvent");
                    compEvent.setParams({"objectName" : component.get("v.sobject"),"objectRecordID": returendResult['Id'], "lookUpRowIndex" :component.get("v.lookUpRowIndex"), "componentId" : component.get("v.componentId")});   
                    compEvent.fire();
                    
                }
            });
            $A.enqueueAction(serverAction);    
            
            //} 
        }
        
    },
     valueSet : function(component, event, helper) {
        if(component.get("v.value")){
            
            if(component.get("v.value") != component.get("v.oldValue")){
                if(component.get("v.value").length >= 18){ 
                    var serverAction = component.get("c.getrecordFromId");
                    serverAction.setParams({ objName : component.get("v.sobject") , rId : component.get("v.value"), qField : component.get("v.queryField")});
                    serverAction.setCallback(this, function(response) {
                        try{
                            var state = response.getState();
                            $A.util.addClass(component.find("ajaxRequest"),'slds-hide');
                            var returendResult = response.getReturnValue();
                            component.set("v.displayValue",returendResult['Name']);
                            component.set("v.value",returendResult['Id']);
                            component.set("v.oldValue",returendResult['Id']);
                            $A.util.addClass(component.find("inputBar"),'slds-hide');
                            $A.util.removeClass(component.find("inputBar"),'slds-show');
                            $A.util.addClass(component.find("outputBar"),'slds-show');
                            $A.util.removeClass(component.find("outputBar"),'slds-hide');
                            $A.util.removeClass(component.find("selectionButton"),'slds-button--neutral');
                            var compEvent = component.getEvent("lookUpEvent");
                            compEvent.setParams({"objectName" : component.get("v.sobject"),"objectRecordID": returendResult['Id'], "lookUpRowIndex" :component.get("v.lookUpRowIndex"), "componentId" : component.get("v.componentId")});   
                            compEvent.fire();
                            helper.hideresult(component, event, helper);
                        }
                        catch(e){
                            console.log('### Exception: '+e);
                            
                        }
                    });
                    $A.enqueueAction(serverAction); 
                }
            }
        }else{      try{    
            component.set("v.displayValue",'');
            //component.set("v.value",'');
            component.set("v.oldValue",'');
            component.set("v.searchresult",[]);
            $A.util.addClass(component.find("inputBar"),'slds-show');
            $A.util.removeClass(component.find("inputBar"),'slds-hide');
            $A.util.addClass(component.find("outputBar"),'slds-hide');
            $A.util.removeClass(component.find("outputBar"),'slds-show');
        }
              catch(e){
                  console.log('### Exception: '+e);
                  
              }
              
             }
    },
   
    setSearchString : function(component, event, helper) {
        var searchText = component.get("v.displayValue");
        if(searchText.length >0){
            var cmp = component.find("lookupComponent");
            $A.util.removeClass(cmp,'slds-is-closed');
            $A.util.addClass(cmp,'slds-is-open');
            //alert(component.get("v.RevenueCategoryid"));
            $A.util.removeClass(component.find("ajaxRequest"),'slds-hide');
            var serverAction = component.get("c.sobjResult1");
            serverAction.setParams({ searchtext : component.get("v.displayValue") , sobj : component.get("v.sobject"), qField : component.get("v.queryField"), fixField : component.get("v.fixedField"), fixFieldValue : component.get("v.fixedFieldValue"),revCategoryId: component.get("v.RevenueCategoryid") });
            serverAction.setCallback(this, function(response) {
                $A.util.addClass(component.find("ajaxRequest"),'slds-hide');
                var returendResult = response.getReturnValue();
                component.set("v.searchresult",returendResult);
            });
            $A.enqueueAction(serverAction);
        }
        else{
            var cmp = component.find("lookupComponent");
            $A.util.removeClass(cmp,'slds-is-open');
            $A.util.addClass(cmp,'slds-is-closed');
            
        }
    },
     selectThisRecord : function(component, event, helper) {
        var selectedItem = event.currentTarget;
        var index = selectedItem.dataset.record;
        var selectedRecord = component.get("v.searchresult")[index];
        component.set("v.displayValue",selectedRecord['Name']);
        component.set("v.value",selectedRecord['Id']);
        component.set("v.oldValue",selectedRecord['Id']);
        $A.util.addClass(component.find("inputBar"),'slds-hide'); 
        $A.util.addClass(component.find("outputBar"),'slds-show');
        $A.util.removeClass(component.find("inputBar"),'slds-show');
        $A.util.removeClass(component.find("outputBar1"),'slds-hide');
        helper.hideresult(component, event, helper);
        
        var aa = component.find('aaaa');
        aa.focus();
        component.set("v.disabledInputText",true);
        
        //component.find("selectionButton").getElement().focus();
        
    },
    resetThisLookUpRecord : function(component, event, helper) {
        component.set("v.displayValue",'');
        component.set("v.value",'');
        component.set("v.oldValue",'');
        component.set("v.searchresult",[]);
        component.set("v.disabledInputText",false);
        $A.util.addClass(component.find("inputBar"),'slds-show');
        $A.util.removeClass(component.find("inputBar"),'slds-hide');
        $A.util.addClass(component.find("outputBar"),'slds-hide');
        $A.util.removeClass(component.find("outputBar"),'slds-show');
        
        var compResetEvent = component.getEvent("lookUpResetEvent");
        compResetEvent.setParams({"objectName" : component.get("v.sobject"),"lookUpRowIndex" :component.get("v.lookUpRowIndex"), "componentId" : component.get("v.componentId")});   
        compResetEvent.fire();
        
        
    }

})