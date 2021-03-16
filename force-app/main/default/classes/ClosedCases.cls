public class ClosedCases {
    public static ApexPages.StandardSetController setCon{
        get {

            if(setCon==null){
                User currentUser = [SELECT Id, ContactId FROM User WHERE Id=:UserInfo.getUserId()]; 
                //Above is final code; below is for testing purposes
                //User currentUser = [SELECT Id, ContactId FROM User WHERE Id='0055Y00000EDZc8QAH'];
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Id, CaseNumber, Subject, Description, Status FROM Case WHERE ContactId = :currentUser.ContactId AND Status = 'Closed' ORDER BY CaseNumber DESC LIMIT 10]));
                
            }
        return setCon;
        }
        set;

    }

    public static List<Case> getClosedCases(){
        List<Case> closedCaseList = new List<Case>();
        List<Case> records = setCon.getRecords();
        for(Case cs : records){
                closedCaseList.add(cs);
        }
        //System.debug(records);
        return closedCaseList;
    }
}