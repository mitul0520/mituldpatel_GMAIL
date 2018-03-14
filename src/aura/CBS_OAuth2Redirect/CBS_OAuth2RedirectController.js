({
	doInit: function (component, event, helper) {
        console.log("getting parameter from page: ");
        //console.log("Location: " + window.location);
        
        //function to get url parameter
        //Source: https://developer.salesforce.com/forums/?id=906F0000000g1blIAA
         var getUrlParameter = function getUrlParameter(sParam) {
                var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                    sURLVariables = sPageURL.split('&'),
                    sParameterName,
                    i;

                for (i = 0; i < sURLVariables.length; i++) {
                    sParameterName = sURLVariables[i].split('=');

                    if (sParameterName[0] === sParam) {
                        return sParameterName[1] === undefined ? true : sParameterName[1];
                    }
                }
            };
        
        var strCode = getUrlParameter('code');
        component.set("v.code", strCode);
        
        console.log ("Call c.getToken with code "+ strCode+ " start.");
        //Create the action
        var action = component.get("c.getToken")
        action.setParams({
            "code": strCode
        });
        
        // Add callback
        action.setCallback(this, function(response){
        var state = response.getState();
        console.log ("Callback function start");
        if (component.isValid() && state === "SUCCESS") {
                 console.log("getToken Success with state: " + state);                 
            }
            else {
                console.log("getToken Failed with state: " + state);
            }
        });
        
        //Send action off to be executed
        $A.enqueueAction(action);
    }//doInit
})