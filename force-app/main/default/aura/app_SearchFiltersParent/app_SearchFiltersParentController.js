({
    doInit : function(component, event, helper) {
        var key = component.get("v.key");
        var map = component.get("v.map");
        
        // set the values of map to the value attribute	
        // to get map values in lightning component use "map[key]" syntax. 
        component.set("v.value" , map[key]);
    },
    scriptsLoaded : function(component, event, helper) {
        console.log('load successfully');
        
        // active/call select2 plugin function after load jQuery and select2 plugin successfully    
        $(".select2Class").select2({
            placeholder: "Select Multiple values"
        });
    },
    getValue : function(component, event, helper) {
alert('LLLLLL');
        component.set("v.value1", _counter.getValue());
    }
})