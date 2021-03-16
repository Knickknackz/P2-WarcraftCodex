public class JSON2Apex {

	public Integer encounterID {get;set;} 
	public String encounterName {get;set;} 
	public String class_Z {get;set;} // in json: class
	public String spec {get;set;} 
	public Integer rank {get;set;} 
	public Integer outOf {get;set;} 
	public Integer duration {get;set;} 
	public Long startTime {get;set;} 
	public String reportID {get;set;} 
	public Integer fightID {get;set;} 
	public Integer difficulty {get;set;} 
	public Integer characterID {get;set;} 
	public String characterName {get;set;} 
	public String server {get;set;} 
	public Double percentile {get;set;} 
	public Integer ilvlKeyOrPatch {get;set;} 
	public Double total {get;set;} 
	public Boolean estimated {get;set;} 

	public JSON2Apex(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'encounterID') {
						encounterID = parser.getIntegerValue();
					} else if (text == 'encounterName') {
						encounterName = parser.getText();
					} else if (text == 'class') {
						class_Z = parser.getText();
					} else if (text == 'spec') {
						spec = parser.getText();
					} else if (text == 'rank') {
						rank = parser.getIntegerValue();
					} else if (text == 'outOf') {
						outOf = parser.getIntegerValue();
					} else if (text == 'duration') {
						duration = parser.getIntegerValue();
					} else if (text == 'startTime') {
						startTime = parser.getLongValue();
					} else if (text == 'reportID') {
						reportID = parser.getText();
					} else if (text == 'fightID') {
						fightID = parser.getIntegerValue();
					} else if (text == 'difficulty') {
						difficulty = parser.getIntegerValue();
					} else if (text == 'characterID') {
						characterID = parser.getIntegerValue();
					} else if (text == 'characterName') {
						characterName = parser.getText();
					} else if (text == 'server') {
						server = parser.getText();
					} else if (text == 'percentile') {
						percentile = parser.getDoubleValue();
					} else if (text == 'ilvlKeyOrPatch') {
						ilvlKeyOrPatch = parser.getIntegerValue();
					} else if (text == 'total') {
						total = parser.getDoubleValue();
					} else if (text == 'estimated') {
						estimated = parser.getBooleanValue();
					} else {
						System.debug(LoggingLevel.WARN, 'JSON2Apex consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	
	public static List<JSON2Apex> parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return arrayOfJSON2Apex(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	

    private static List<JSON2Apex> arrayOfJSON2Apex(System.JSONParser p) {
        List<JSON2Apex> res = new List<JSON2Apex>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new JSON2Apex(p));
        }
        return res;
    }


}