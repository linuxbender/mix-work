package ch.starwolf.jwarrior.util;

import ch.starwolf.jwarrior.util.mapping.*;

public class RouteHelper implements IRouteHelper {
	private IArea area;	
	
	public RouteHelper()
	{		
		this.area = new Area(new Route());		
	}

	public IController NoArea()
	{		
		return area.NoArea();
	}

	public IController AdminArea()
	{		
		return this.area.AdminArea();
	}
	
	public IController HomeArea()
	{	
		return this.area.HomeArea();
	}	
}
