/**
 * Created by nguyen.nghia@mulodo.com on 10/3/2017.
 */
/** Description: GlobalHttpMockHub For All Http Request Test
 *  If User request to endpoint on test, System will redirect to fakeResponse from this class
*/
@isTest
public class MR_GlobalHttpMock implements HttpCalloutMock{
	// list of end point will be available in HttpCalloutMock
	private static final String O_WEATHER_ROOT_ENDPOINT = 'http://api.openweathermap.org/data/2.5/';
	// implements interface
	public static HttpResponse respond(HttpRequest request) {
		HttpResponse fakeRes = new HttpResponse();
		// if request to openWeather map
		if (
			request.getEndpoint().indexOf(O_WEATHER_ROOT_ENDPOINT) == 0
		) {
			String fakeResponseString = '{"coord":{"lon":139,"lat":35},"sys":{"country":"JP","sunrise":1369769524,"sunset":1369821049},"weather":[{"id":804,"main":"clouds","description":"overcast clouds","icon":"04n"}],"main":{"temp":289.5,"humidity":89,"pressure":1013,"temp_min":287.04,"temp_max":292.04},"wind":{"speed":7.31,"deg":187.002},"rain":{"3h":0},"clouds":{"all":92},"dt":1369824698,"id":1851632,"name":"Shuzenji","cod":200}';
			fakeRes.setHeader('Content-Type', 'application/json'); // JSON OBJECT
			fakeRes.setBody(fakeResponseString);
			fakeRes.setStatusCode(200); // OK
			return fakeRes;
		}
		// default fakeRes return;
		fakeRes.setHeader('Content-Type', 'text/plain');
		fakeRes.setBody('Http Mock Work!');
		fakeRes.setStatusCode(200); // OK
		return fakeRes;
	}
}