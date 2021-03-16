({
	myAction : function(component, event, helper) {
		var action = component.get("c.getCharacters");
        action.setCallback(this, function(data){
                           component.set("v.Characters", data.getReturnValue());
                           });
        component.set("v.Columns", [
            {label:"Name", fieldName:"CharacterURL__c", type: "url", typeAttributes:{label:{fieldName:'Name'}}},
            {label:"Region", fieldName:"Region__c", type:"text"},
            {label:"Server", fieldName:"Server__c", type:"text"}
        ]);
        $A.enqueueAction(action);
        }

})