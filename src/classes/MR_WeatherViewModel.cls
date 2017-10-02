/** View Model Of Weather data which is received FRom openWeather
*/
public with sharing class MR_WeatherViewModel{
	public cls_coord coord {get;}
	public cls_sys sys {get;}
	public cls_weather[] weather {get;}
	public cls_main main {get;}
	public cls_wind wind {get;}
	public cls_rain rain {get;}
	public cls_clouds clouds {get;}
	public Integer dt {get;}	// 1369824698
	public Integer id {get;}	// 1851632
	public string name {get;}	// Shuzenji
	public Integer cod {get;}	//200
	public class cls_coord {
		public Double lon {get;}	//139.5
		public Double lat {get;}	//35.4
	}
	public class cls_sys {
		public String country {get;}	//JP
		public Integer sunrise {get;}	//1369769524
		public Integer sunset {get;}	//1369821049
	}
	public class cls_weather {
		public Integer id {get;}	//804
		public String main {get;}	//clouds
		public String description {get;} 	//overcast clouds
		public String icon {get;}	//04n
	}
	public class cls_main {
		public Double temp {get;}	//289.5
		public Integer humidity {get;}	//89
		public Integer pressure {get;}	//1013
		public Double temp_min {get;}	//287.04
		public Double temp_max {get;}	//292.04
	}
	public class cls_wind {
		public Double speed {get;}	//7.31
		public Double deg {get;}	//187.002
	}
	public class cls_rain {
		// change to threeHour props
		public Integer threeHour {get;}	//0
	}
	public class cls_clouds {
		public Integer all {get;}	//92
	}
}