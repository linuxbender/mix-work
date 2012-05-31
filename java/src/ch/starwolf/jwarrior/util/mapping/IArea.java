package ch.starwolf.jwarrior.util.mapping;

public interface IArea {
	// no area
	IController NoArea();
	// example admin area
	IController AdminArea();
	// example home area
	IController HomeArea();
}
