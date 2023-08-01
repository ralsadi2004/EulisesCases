public class ParkLocator {
	public static String[] country(String x) 
	{
       	 	ParkService.ParksImplPort  countrys = new ParkService.ParksImplPort ();     	
       		return countrys.byCountry(x);
	}
}