package ch.starwolf.jwarrior;

import ch.starwolf.jwarrior.util.RouteHelper;
import ch.starwolf.jwarrior.util.IRouteHelper;

public class Demo {
	
	public static void main(String[] args) {
		
		IRouteHelper rh = new RouteHelper();
		String mvcRoutePath;
				
		mvcRoutePath = rh.AdminArea().HomeController().DeletView();
		System.out.println(mvcRoutePath); // output is: /AdminArea/home/delete		
		
		mvcRoutePath  = rh.NoArea().HomeController().CreateView();
		System.out.println(mvcRoutePath); // output is: /home/create		
		
		mvcRoutePath  = rh.NoArea().NoController().DeletView();
		System.out.println(mvcRoutePath); // output is: /delete
	}
}//end of class
