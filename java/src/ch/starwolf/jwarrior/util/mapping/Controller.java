package ch.starwolf.jwarrior.util.mapping;

import static ch.starwolf.jwarrior.util.Constant.Controller.ADMIN;
import static ch.starwolf.jwarrior.util.Constant.Controller.HOME;

public final class Controller implements IController {

	private IRoute route;	
		
	public Controller(IRoute route)
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
		
	public IView HomeController() {
		this.route.setPath(HOME);
		return new View(this.route);
	}
	
	public IView AdminController() {
		this.route.setPath(ADMIN);
		return new View(this.route);
	}
	
	public IView NoController() {		
		return new View(this.route);
	}
}
