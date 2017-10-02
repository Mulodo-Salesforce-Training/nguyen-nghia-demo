/**
 * Created by admin_1 on 26/09/2017.
 */
@isTest
private class TestWeatherController {
	// test demo api from SG
	@isTest static void testGetAPI() {
		CandidateWeatherController weatherController = new CandidateWeatherController();
		// test api
		WeatherViewModel weather = weatherController.getWeather();
		System.assert(weather != null);
	}
}