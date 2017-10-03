/**
 * Created by admin_1 on 28/09/2017.
 */
@isTest private class MR_WeatherViewModelTest {
	@isTest static void testAllFields() {
		MR_WeatherViewModel weather = new MR_WeatherViewModel();
		weather.name = 'Hanoi, Vietnam';
		weather.id = 1851632;
		weather.cod = 200;
		weather.dt = 1369824698;

		weather.coord = new MR_WeatherViewModel.cls_coord();
		weather.coord.lon = 139;
		weather.coord.lat = 35.4;

		weather.sys = new MR_WeatherViewModel.cls_sys();
		weather.sys.country = 'JP';
		weather.sys.sunrise = 1369769524;
		weather.sys.sunset = 1369821049;
		MR_WeatherViewModel.cls_weather childWeather = new MR_WeatherViewModel.cls_weather();
		childWeather.id = 804;
		childWeather.main = 'Clouds';
		childWeather.description = 'Overcasts clouds';
		childWeather.icon = '04n';
		weather.weather = new MR_WeatherViewModel.cls_weather[] {childWeather};
		weather.main = new MR_WeatherViewModel.cls_main();
		weather.main.temp = 3000;
		weather.main.humidity = 89;
		weather.main.pressure =1013;
		weather.main.temp_min = 287.04;
		weather.main.temp_max = 292.04;
		weather.wind = new MR_WeatherViewModel.cls_wind();
		weather.wind.speed = 7.31;
		weather.wind.deg = 187.002;
		weather.rain = new MR_WeatherViewModel.cls_rain();
		weather.rain.threeHour = 0;
		weather.clouds = new MR_WeatherViewModel.cls_clouds();
		weather.clouds.all = 92;

		System.assertEquals(weather.name, 'Hanoi, Vietnam');
		System.assertEquals(weather.id, 1851632);
		System.assertEquals(weather.cod, 200);
		System.assertEquals(weather.dt, 1369824698);
		System.assertEquals(weather.coord.lon, 139);
		System.assertEquals(weather.coord.lat, 35.4);
		System.assertEquals(weather.sys.country, 'JP');
		System.assertEquals(weather.sys.sunrise, 1369769524);
		System.assertEquals(weather.weather.size(), 1);
		System.assertEquals(weather.weather[0].id, 804);
		System.assertEquals(weather.weather[0].main, 'Clouds');
		System.assertEquals(weather.weather[0].description, 'Overcasts clouds');
		System.assertEquals(weather.weather[0].icon, '04n');
		System.assertEquals(weather.main.temp, 3000);
		System.assertEquals(weather.main.humidity, 89);
		System.assertEquals(weather.main.pressure, 1013);
		System.assertEquals(weather.main.temp_min, 287.04);
		System.assertEquals(weather.main.temp_max, 292.04);
		System.assertEquals(weather.wind.speed, 7.31);
		System.assertEquals(weather.wind.deg,  187.002);
		System.assertEquals(weather.rain.threeHour, 0);
		System.assertEquals(weather.clouds.all, 92);
	}
}