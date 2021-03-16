public class MyCharacterListController {
	@AuraEnabled
    public static List<Character__c> getCharacters(){
        return [Select Id, Name, Region__c, Server__c, CharacterURL__c From Character__c];
    }
}