({
	updateCharacter : function(component, event, helper) {
        var action = component.get("c.updateCharacterFromId");
        var charId = component.get("v.recordId");
        action.setParams({"charId":charId});
        $A.enqueueAction(action);
        
        var urlEvent = $A.get("e.force:navigateToURL");
        console.log(charId);
        urlEvent.setParams({"url":"/character/" + charId});
        urlEvent.fire();
	}
})