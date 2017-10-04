/**
 * Created by admin_1 on 26/09/2017.
 */
public class MR_CandidateWeatherCC {
	//	appIdIsRequired by api.openweathermap
	private static String API_KEY; // will retrieve from metadata
	@TestVisible private String cityName = 'Saigon,vietnam'; // default city if not declare
	// endpoint format
	private static final String BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
	private static final String API_URL_FORMAT = BASE_URL + 'q={0}&appid={1}';// 0: cityName, 1: apiKey
	public MR_WeatherViewModel currentWeather { get;set; }

	// constructor
	public MR_CandidateWeatherCC() {
		Id id = ApexPages.currentPage().getParameters().get('id'); // get id by ApexPages.currentPage() context
		cityName = GetCityByCandidateId(id) != null ? GetCityByCandidateId(id) : cityName; //ternary operator
		API_KEY = [SELECT apikey__c FROM External_App_Setting__mdt WHERE label = 'weatherAPI'].apikey__c; // retrieve apiKey from AppSetting metadata a
		currentWeather = getWeather(cityName);
	}

	public static MR_WeatherViewModel getWeather(String cityName) {
		String requestUrl = String.format(API_URL_FORMAT, new String[] {cityName, API_KEY});
		Http h = new Http();
// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
		HttpRequest req = new HttpRequest();
		req.setEndpoint(requestUrl);
		req.setMethod('GET');
		HttpResponse res = h.send(req);
		MR_WeatherViewModel resWeather = parseToWeatherVM(res.getBody());
		return resWeather;
	}

	public static MR_WeatherViewModel parseToWeatherVM(String json){
		return (MR_WeatherViewModel) System.JSON.deserialize(json, MR_WeatherViewModel.class);
	}

	public static String GetCityByCandidateId(Id id) {
		Candidate__c candidate = [SELECT City__c, Country__c FROM Candidate__c WHERE Id=: id];
		if (String.isEmpty(candidate.City__c) && String.isEmpty(candidate.Country__c)) {
			return null;
		}
		return candidate.City__c + ',' + candidate.Country__c;
	}

}