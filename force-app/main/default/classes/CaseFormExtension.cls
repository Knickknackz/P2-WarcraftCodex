public class CaseFormExtension {
    public Case myCase {get;set;}
    ApexPages.StandardController sController;
    
    public caseFormExtension(ApexPages.StandardController stdController) { 
        sController = stdcontroller;
    }
    

    public Pagereference save(){
        sController.save();
        PageReference pref = new PageReference('/apex/CaseThankYouPage');
        pref.setRedirect(true);

        return pref;
    }
    
}