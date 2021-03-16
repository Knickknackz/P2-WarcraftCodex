public class characterController {
	@AuraEnabled
    public static Character__c upsertCharacter(String cName, String cServer, String cRegion){
        List<JSON2Apex> rankingList = restTest.makeCallout(cName, cServer, cRegion);
        if(rankingList.size() > 0){
            List<Ranking__c> newRankings = new List<Ranking__c>();
            Character__c newCharacter = new Character__c();
            newCharacter.Name = cName;
            newCharacter.Server__c = cServer;
            newCharacter.Region__c = cRegion;
            newCharacter.Class__c = rankingList[0].class_Z;
            newCharacter.CharacterId__c = cName + '/'+ cServer + '/' + cRegion;
            System.debug(newCharacter);
            upsert newCharacter CharacterId__c;   
            for(JSON2Apex ranking: rankingList){
                Ranking__c newRank = new Ranking__c();
                newRank.Name = ranking.encounterName;
                newRank.Percentile__c = ranking.percentile;
                newRank.Raid_Name__c = 'Naxxramas';
                newRank.Rank__c = ranking.rank;
                newRank.Rank_Total__c = ranking.outOf;
                newRank.Spec__c = ranking.spec;
                newRank.Value__c = ranking.total;
                newRank.Character__c = newCharacter.Id;
                newRank.RankingId__c = ranking.encounterName + '/' + ranking.spec + '/' + newCharacter.CharacterId__c;
                newRankings.add(newRank);
            }
            System.debug(newRankings[0].Percentile__c);
            upsert newRankings RankingId__c;
            return newCharacter;
        }
        return null;
    }
    
    @AuraEnabled
    public static Character__c updateCharacterFromId(Id charId){
        Character__c uChar = [SELECT Id, Region__c, Server__c, Name FROM Character__c WHERE Id = :charId];
        return characterController.upsertCharacter(uChar.Name, uChar.Server__c, uChar.Region__c);
    }
}