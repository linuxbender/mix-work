package ch.starwolf.jwarrior.util.mapping;

import static ch.starwolf.jwarrior.util.Constant.View.INDEX;
import static ch.starwolf.jwarrior.util.Constant.View.CREATE;
import static ch.starwolf.jwarrior.util.Constant.View.DELETE;
import static ch.starwolf.jwarrior.util.Constant.View.EDIT;

public final class View implements IView {
	private IRoute route;
	
	public View(IRoute route)
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
		
	public String IndexView() {
		this.route.setPath(INDEX);
		return this.route.toString();	
	}
	
	public String EditView() {
		this.route.setPath(EDIT);
		return this.route.toString();	
	}
	
	public String DeletView() {
		this.route.setPath(DELETE);
		return this.route.toString();	
	}
	
	public String CreateView() {
		this.route.setPath(CREATE);
		return this.route.toString();	
	}
}
