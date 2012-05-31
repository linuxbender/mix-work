package ch.starwolf.jwarrior.util.mapping;

import static ch.starwolf.jwarrior.util.Constant.Area.HOME;
import static ch.starwolf.jwarrior.util.Constant.Area.ADMIN;

public final class Area implements IArea {

	private IRoute route;	
	
	public Area(IRoute route)
	{
		if(route == null)
		{
			this.route = new Route();
		} 
		else
		{
			this.route = route;
		}
	}
	
	public IController NoArea() {		
		return new Controller(this.route);
	}
	
	public IController AdminArea() {		
		this.route.setPath(ADMIN);		
		return new Controller(this.route);		
	}
	
	public IController HomeArea() {				
		this.route.setPath(HOME);
		return new Controller(this.route);
	}	
}
