({
    getContacts : function(component, helper) { 
        var action = component.get("c.listofBasicData");
        action.setStorable();
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('Response Time: '+((new Date().getTime())-requestInitiatedTime));
                component.set("v.totalPages", response.getReturnValue().size);
                component.set("v.allData", response.getReturnValue().listofContact);
                component.set("v.currentPageNumber",1);
                component.set("v.currentminimumNumber",1);
                component.set("v.currentmaximumNumber",50);
                helper.buildData(component, helper);
            }
        });
        var requestInitiatedTime = new Date().getTime();
        $A.enqueueAction(action);
    },
    
    /*
     * this function will build table data
     * based on current page selection
     * */
    buildData : function(component, helper) {
        var data = [];
        var pageNumber = component.get("v.currentPageNumber");
        var pageSize = component.get("v.pageSize");
        
        /* Newly added */
        var minimumNumber = component.get("v.currentminimumNumber"); 
        var maximumNumber = component.get("v.currentmaximumNumber"); 
        
        if(pageNumber < minimumNumber || pageNumber > maximumNumber){
            var newdata = [];
            var newpageNumber = component.get("v.currentPageNumber");
            alert('>>>>>>>>>>>>>>>'+newpageNumber);
            var action = component.get("c.listofdynamicData");
            action.setParams({ "currentPageNumber" : newpageNumber });
            action.setStorable();
            action.setCallback(this,function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    console.log('Response Time: '+((new Date().getTime())-requestInitiatedTime));
                    component.set("v.allData", response.getReturnValue().listofContact);
                    component.set("v.currentminimumNumber",response.getReturnValue().minimumPage);
                    component.set("v.currentmaximumNumber",response.getReturnValue().maximumPage);
                    var allData = component.get("v.allData");
                    var a = newpageNumber;
                    while(newpageNumber > 50){
                       newpageNumber = newpageNumber - 50; 
                    }
                    alert(newpageNumber);
                    
                    var x = (newpageNumber-1)*pageSize;
                    
                    //creating data-table data
                    for(; x<=(newpageNumber)*pageSize; x++){
                        if(allData[x]){
                            newdata.push(allData[x]);
                        }
                    }
                    console.log('>>>>>>>>>>>'+newdata);
                    component.set("v.data", newdata);
                    
                    helper.generatePageList(component, a);
                }
            });
            var requestInitiatedTime = new Date().getTime();
            $A.enqueueAction(action); 
            
            
        }
        /* Newly added */
        
        else{
            var allData = component.get("v.allData");
            var x = (pageNumber-1)*pageSize;
            
            //creating data-table data
            for(; x<=(pageNumber)*pageSize; x++){
                if(allData[x]){
                    data.push(allData[x]);
                }
            }
            component.set("v.data", data);
            
            helper.generatePageList(component, pageNumber);
        }
    },
    
    /*
     * this function generate page list
     * */
    generatePageList : function(component, pageNumber){
        pageNumber = parseInt(pageNumber);
        var pageList = [];
        var totalPage = component.get("v.totalPages");
        if(pageNumber<5){
            pageList.push(2,3,4,5,6);
        } else if(pageNumber>(totalPage-5)){
            pageList.push(totalPage-5, totalPage-4, totalPage-3, totalPage-2, totalPage-1);
        } else{
            pageList.push(pageNumber-2, pageNumber-1, pageNumber, pageNumber+1, pageNumber+2);
        }
        component.set("v.pageList", pageList);
    }
    
})