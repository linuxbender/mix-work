package ch.starwolf.jwarrior.util.mapping;

import static ch.starwolf.jwarrior.util.Constant.Route.SEPARATOR;
import static ch.starwolf.jwarrior.util.Constant.Route.EMPTY;

public final class Route implements IRoute {
	
	private String Path;
	
	public Route()
	{
		this.resetPath();
	}
		
	private String getPath() {		
		return Path;
	}
	
	private String setPathSeparator()
	{
		return SEPARATOR;
	}
	
	private void resetPath()
	{
		this.Path = EMPTY;
	}

	public void setPath(String path){
		Path += this.setPathSeparator() + path;
	}
	
	public String toString() {
		String path = this.getPath();
		this.resetPath();
	 return path;
	}
}