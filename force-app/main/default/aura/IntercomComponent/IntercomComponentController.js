({
    
    doinit : function(component, event, helper) { 
           /* component.set('v.columns', [
            {label: 'Type', fieldName: 'type_Z', type: 'text'},
            {label: 'Id', fieldName: 'id', type: 'text'},
            {label: 'User Id', fieldName: 'user_id', type: 'text'},
            {label: 'Anonymous', fieldName: 'anonymous', type: 'Object'},
            {label: 'Email', fieldName: 'email', type: 'text'},
            {label: 'Phone', fieldName: 'phone', type: 'phone'},
            {label: 'Name', fieldName: 'name', type: 'text'},
            {label: 'Pseudonym', fieldName: 'pseudonym', type: 'phone'},
            {label: 'Avatar',fieldName:'avatar',typeAttributes:{label:'Type',fieldName:'type_Z',type:'text'}}
             ]);  */
             var action = component.get("c.getfromJSON");
             action.setCallback(this,function(response){
             component.set("v.response", response.getReturnValue());
             console.log(component.get('v.response'));
            });
            $A.enqueueAction(action);
            }
            })