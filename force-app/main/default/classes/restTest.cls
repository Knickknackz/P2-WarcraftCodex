public class restTest {
	public static List<JSON2Apex> makeCallout(String c, String s, String r){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://classic.warcraftlogs.com/v1/rankings/character/' + c + '/' + s + '/' + r + '?api_key=b36eaaadffcf3d218dc7476ee731985d');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
			String jsonString = response.getBody();
            List<JSON2Apex> myClass = JSON2Apex.parse(jsonString);
            System.debug(myClass);
            return myClass;
        }
        return null;         
    }
   
}