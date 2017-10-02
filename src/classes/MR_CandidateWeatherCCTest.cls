/**
 * Created by admin_1 on 26/09/2017.
 */
@isTest
private class MR_CandidateWeatherCCTest {
	// test demo api from SG
	@isTest static void testGetAPI() {
		MR_CandidateWeatherCC weatherController = new MR_CandidateWeatherCC();
		// test api
		MR_WeatherViewModel weather = weatherController.getWeather();
		System.assert(weather != null);
	}
}