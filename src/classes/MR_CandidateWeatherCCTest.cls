/**
 * Created by admin_1 on 26/09/2017.
 */
@isTest
private class MR_CandidateWeatherCCTest {
	/** Description: Data factory
	 * 	Candidate: Candidate Weather CC Need to Query candidate city and country
	 */
	@testSetup static void dataFactory() {
		Candidate__c trueCandidate = new Candidate__c(
				First_Name__c = 'Nghia',
				Last_Name__c = 'Nguyen',
				Email__c = 'nghia.nguyen@mulodo.com',
				Phone__c = '01212132815',
				City__c = 'Saigon',
				Country__c = 'Vietnam'
		);
		insert trueCandidate;
		Candidate__c candidateWithoutCityCountry = new Candidate__c(
				First_Name__c = 'Tran',
				Last_Name__c = 'Binh',
				Email__c = 'nghia.nguyen@mulodo.com',
				Phone__c = '01212132815'
		);
		insert CandidateWithoutCityCountry;


	}
	/** Test Case: Test Constructor
	 *  Expect that weather after constructor is not null and have mockData
	*/
	@isTest static void testConstructorWithTrueCandidate() {
		// data factory
		Candidate__c trueCandidate = [SELECT Id, First_Name__c FROM Candidate__c WHERE Last_Name__c = 'Nguyen' LIMIT 1];
		// Set test Page Reference
		Test.setCurrentPageReference(new PageReference('Page.candidateWeather'));
		System.currentPageReference().getParameters().put('id', trueCandidate.Id); // init fakeId
		// Set mock callout class
		Test.setMock(HttpCalloutMock.class, new MR_GlobalHttpMock());

		Test.startTest();
			MR_CandidateWeatherCC weatherController = new MR_CandidateWeatherCC();
		Test.stopTest();

		System.assert(weatherController.CurrentWeather != null);
		System.assert(weatherController.CurrentWeather.name == 'Shuzenji'); // expect to use the correct mock API
	}

	/** Test Case: Test Constructor
	 *  Expect that weather after constructor is not null and have mockData
	*/
	@isTest static void testConstructorWithWrongCandidate() {
		// data factory
		Candidate__c wrongCandidate = [SELECT Id, First_Name__c FROM Candidate__c WHERE Last_Name__c = 'Binh' LIMIT 1];
		// Set test Page Reference
		Test.setCurrentPageReference(new PageReference('Page.candidateWeather'));
		System.currentPageReference().getParameters().put('id', wrongCandidate.Id); // init fakeId
		// Set mock callout class
		Test.setMock(HttpCalloutMock.class, new MR_GlobalHttpMock());

		Test.startTest();
			MR_CandidateWeatherCC weatherController = new MR_CandidateWeatherCC();
		Test.stopTest();

		System.assert(WeatherController.cityName == 'Saigon,vietnam');
		System.assert(weatherController.CurrentWeather != null);
		System.assert(weatherController.CurrentWeather.name == 'Shuzenji'); // expect to use the correct mock API
	}

	/** Test Static Method GetCityByCandidateId
	*	Expect Result can return correct name
	*/
	@isTest static void testGetCityByCandidateId() {
		// data factory
		Candidate__c trueTarget = [SELECT Id, First_Name__c FROM Candidate__c WHERE Last_Name__c = 'Nguyen' LIMIT 1];
		Candidate__c wrongTarget = [SELECT Id, First_Name__c FROM Candidate__c WHERE Last_Name__c = 'Binh' LIMIT 1];

		Test.startTest();
			String location = MR_CandidateWeatherCC.GetCityByCandidateId(trueTarget.Id);
			String nullLocation = MR_CandidateWeatherCC.GetCityByCandidateId(wrongTarget.Id);
		Test.stopTest();

		System.assert(trueTarget != null && wrongTarget != null, 'Data factory work');
		System.assertEquals(trueTarget.First_Name__c, 'Nghia', 'Fake data success');
		System.assertEquals(location, 'Saigon,Vietnam', 'Get Location Success');

		System.assertEquals(wrongTarget.First_Name__c, 'Tran', 'Fake data success');
		System.assertEquals(nullLocation, null, 'Expect null if candidate not has country and city');
	}

	/** Test Static Method ParseToWeatherVM
	 * Expect Result can return correct WeatherViewModel instance
	*/
	@isTest static void testParseToWeatherVM() {
		String fakeResponseString = '{"coord":{"lon":139,"lat":35},"sys":{"country":"JP","sunrise":1369769524,"sunset":1369821049},"weather":[{"id":804,"main":"clouds","description":"overcast clouds","icon":"04n"}],"main":{"temp":289.5,"humidity":89,"pressure":1013,"temp_min":287.04,"temp_max":292.04},"wind":{"speed":7.31,"deg":187.002},"rain":{"3h":0},"clouds":{"all":92},"dt":1369824698,"id":1851632,"name":"Shuzenji","cod":200}';
		MR_WeatherViewModel weather = MR_CandidateWeatherCC.parseToWeatherVM(fakeResponseString);

		// assert
		System.assert(weather != null, 'Weather is not null');
		System.assert(weather.name == 'Shuzenji', 'Weather name expected');
		System.assert(weather.id == 1851632, 'Weather id expected');
	}

	/** Test Static Method GetWeather (API Callout)
	*  Expect Result can return correct mockData
	*/
	@isTest static void testGetWeather() {
		// set mock callout
		Test.setMock(HttpCalloutMock.class, new MR_GlobalHttpMock());

		Test.startTest();
			MR_WeatherViewModel res = MR_CandidateWeatherCC.getWeather('Saigon,vietnam');
		Test.stopTest();

		// assert
		System.assert(res != null, 'API Work!');
		System.assert(res.name == 'Shuzenji', 'City Name Match');
		System.assert(res.Id == 1851632, 'Id Match');
	}
}