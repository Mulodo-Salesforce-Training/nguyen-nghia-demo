/** View Model Of Weather data which is received FRom openWeather
*/
public with sharing class MR_WeatherViewModel{
	public cls_coord coord {get;set;}
	public cls_sys sys {get;set;}
	public cls_weather[] weather {get;set;}
	public cls_main main {get;set;}
	public cls_wind wind {get;set;}
	public cls_rain rain {get;set;}
	public cls_clouds clouds {get;set;}
	public Integer dt {get;set;}	// 1369824698
	public Integer id {get;set;}	// 1851632
	public string name {get;set;}	// Shuzenji
	public Integer cod {get;set;}	//200
	public class cls_coord {
		public Double lon {get;set;}	//139.5
		public Double lat {get;set;}	//35.4
	}
	public class cls_sys {
		public String country {get;set;}	//JP
		public Integer sunrise {get;set;}	//1369769524
		public Integer sunset {get;set;}	//1369821049
	}
	public class cls_weather {
		public Integer id {get;set;}	//804
		public String main {get;set;}	//clouds
		public String description {get;set;} 	//overcast clouds
		public String icon {get;set;}	//04n
	}
	public class cls_main {
		public Double temp {get;set;}	//289.5
		public Integer humidity {get;set;}	//89
		public Integer pressure {get;set;}	//1013
		public Double temp_min {get;set;}	//287.04
		public Double temp_max {get;set;}	//292.04
	}
	public class cls_wind {
		public Double speed {get;set;}	//7.31
		public Double deg {get;set;}	//187.002
	}
	public class cls_rain {
		// change to threeHour props
		public Integer threeHour {get;set;}	//0
	}
	public class cls_clouds {
		public Integer all {get;set;}	//92
	}
}