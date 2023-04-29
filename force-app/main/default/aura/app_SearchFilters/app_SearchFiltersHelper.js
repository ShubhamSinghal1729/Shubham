({
   fetchPickListVal: function(component, event, helper) {
        //call apex class method 
        var action = component.get('c.getFilterDetails');
        action.setCallback(this, function(response) {
            //store response state 
            var state = response.getState();
            if (state === "SUCCESS") {
                // create a empty array for store map keys 
                var arrayOfMapKeys = [];
                // store the response of apex controller (return map)     
                var StoreResponse = response.getReturnValue();
                console.log('StoreResponse' + StoreResponse);
                // set the store response[map] to component attribute, which name is map and type is map.   
                component.set('v.fullMap', StoreResponse);
 
                for (var singlekey in StoreResponse) {
                    arrayOfMapKeys.push(singlekey);
                }
                console.log('>>>>>>'+arrayOfMapKeys);
                // Set the all list of keys on component attribute, which name is lstKey and type is list.     
                component.set('v.lstKey', arrayOfMapKeys);
            }
        });
        // enqueue the Action   
        $A.enqueueAction(action);
    }
    
    ,
    fetchData: function(component){
        var selectedSkills = $('[id$=countries]').select2("val");
        var filters = {};
        // var filters={"app_search[region_ids]":[],"app_search[country_ids]":[],"app_search[states]":[],"app_search[cities]":[],,"app_search[university_ids]":[],"app_search[cities]":[],"app_search[cities]":[],"app_search[cities]":[],"app_search[cities]":[],"app_search[cities]":[],"app_search[cities]":[],"app_search[cities]":[],"app_search[cities]":[],"app_search[cities]":[],"app_search[cities]":[] };
        filters["app_search[region_ids]"] =  [];
        filters["app_search[country_ids]"] =  [];
        filters["app_search[states]"] =  [];
        filters["app_search[cities]"] =  [];
        filters["app_search[university_ids]"] = [];
        filters["app_search[company_ids]"] = [];
        filters["app_search[family_office_type]"] = [];
        filters["app_search[geographic_area_ids]"] = [];
        filters["app_search[investor_type_ids]"] =  [];
        filters["app_search[family_wealth_origin]"] =  [];
        filters["app_search[industry_wealth_origin_ids]"] = [];
        filters["app_search[invest_in_ids]"] = [];
        filters["app_search[strategy_ids]"] =  [];
        filters["app_search[aum_ids]"] = []; 
        filters["app_search[emergingmanager]"] = []; 
        filters["app_search[region_ids]"].push($('[id$=regions]').select2("val"));
        filters["app_search[country_ids]"].push($('[id$=countries]').select2("val"));
        filters["app_search[states]"].push($('[id$=states]').select2("val"));
        filters["app_search[cities]"].push($('[id$=cities]').select2("val"));
        filters["app_search[university_ids]"].push($('[id$=universities]').select2("val"));
        filters["app_search[company_ids]"].push($('[id$=companies]').select2("val"));
        filters["app_search[family_office_type]"].push($('[id$=companies]').select2("val"));
        filters["app_search[geographic_area_ids]"].push($('[id$=geographicAreas]').select2("val"));
        filters["app_search[investor_type_ids]"].push($('[id$=investorTypes]').select2("val"));
        filters["app_search[family_wealth_origin]"].push($('[id$=familyWealthOrigins]').select2("val"));
        filters["app_search[industry_wealth_origin_ids]"].push($('[id$=industryWealthOrigins]').select2("val"));
        filters["app_search[invest_in_ids]"].push($('[id$=investIns]').select2("val"));
        filters["app_search[strategy_ids]"].push($('[id$=strategies]').select2("val"));
        filters["app_search[aum_ids]"].push($('[id$=aums]').select2("val"));
        filters["app_search[emergingmanager]"].push($('[id$=emergingManagers]').select2("val"));
        var action = component.get("c.getRequiredFilter");
        action.setParams({
             "mapofFilters": JSON.stringify(filters)
        }); 
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
             
             component.set("v.conDetail",response.getReturnValue());
             component.set("v.Spinner",true);
               console.log('>>>>>>'+response.getReturnValue());
               console.log('@@@@@@@@@@@@'+component.get("v.conDetail").contacts);
            } 
        });
         $A.enqueueAction(action); 
        
    }
})