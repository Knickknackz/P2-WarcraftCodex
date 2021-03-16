({
	myAction : function(component, event, helper) {
		var action = component.get("c.getCharacters");
        var checkCmp = component.find("checkbox");
        action.setParams({healer:checkCmp.get("v.value")});
        action.setCallback(this, function(data){
                           component.set("v.cWrap", data.getReturnValue());
                           });
        component.set("v.Columns", [ 
            {label:"Name", fieldName:"charURL", type: "url", typeAttributes:{label:{fieldName:'cName'}}},
            {label:"Class", fieldName:"class_Z", type:"text"},
            {label:"Average", fieldName:"avg", type: "Number",cellAttributes:{class:{fieldName:"avgF"}}},
            {label:"Patchwerk", fieldName:"patch", type: "Number", cellAttributes:{class:{fieldName:"patchF"}}},
            {label:"Grobbulus", fieldName:"grob", type: "Number", cellAttributes:{class:{fieldName:"grobF"}}},
            {label:"Gluth", fieldName:"gluth", type: "Number", cellAttributes:{class:{fieldName:"gluthF"}}},
            {label:"Thaddius", fieldName:"thad", type: "Number", cellAttributes:{class:{fieldName:"thadF"}}},
            {label:"Noth", fieldName:"noth", type: "Number", cellAttributes:{class:{fieldName:"nothF"}}},
            {label:"Heigan", fieldName:"heigan", type: "Number", cellAttributes:{class:{fieldName:"heiganF"}}},
            {label:"Loatheb", fieldName:"loatheb", type: "Number", cellAttributes:{class:{fieldName:"loathebF"}}},
            {label:"Anub'Rekhan", fieldName:"anub", type: "Number", cellAttributes:{class:{fieldName:"anubF"}}},
            {label:"Faerlina", fieldName:"faerlina", type: "Number", cellAttributes:{class:{fieldName:"faerlinaF"}}},
            {label:"Maexxna", fieldName:"maexx", type: "Number", cellAttributes:{class:{fieldName:"maexxF"}}},
            {label:"Razuvious", fieldName:"razuvious", type: "Number", cellAttributes:{class:{fieldName:"razuviousF"}}},
            {label:"Gothik", fieldName:"gothik", type: "Number", cellAttributes:{class:{fieldName:"gothikF"}}},
            {label:"4HM", fieldName:"fourhorse", type: "Number", cellAttributes:{class:{fieldName:"fourhorseF"}}},
            {label:"Sapphiron", fieldName:"sapph", type: "Number", cellAttributes:{class:{fieldName:"sapphF"}}},
            {label:"KT", fieldName:"kt", type: "Number", cellAttributes:{class:{fieldName:"ktF"}}}
        ]);
        $A.enqueueAction(action);
        }

})