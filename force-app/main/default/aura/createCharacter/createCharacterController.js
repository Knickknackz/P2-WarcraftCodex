({
	createCharacter : function(component, event, helper) {
        var thisName = component.find("charName").get("v.value");
        var thisServer = component.find("charServer").get("v.value");
        var thisRegion = component.find("charRegion").get("v.value");
        var action = component.get("c.upsertCharacter");
        action.setParams({"cName":thisName, "cServer":thisServer, "cRegion":thisRegion});
        console.log('STEP 1' + thisName + thisServer + thisRegion);
        action.setCallback(this, function(a) {
            console.log('STEP 2');
            if(a.getState() == "SUCCESS"){
                console.log(a.getReturnValue());
            }
        });
        console.log('STEP 3');
        $A.enqueueAction(action);
        console.log('STEP 4');
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({"url":"/characterlist/"});
        urlEvent.fire();
	}
})