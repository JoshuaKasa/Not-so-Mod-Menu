function circle_hover(x_,y_, radius)
{
	var mx = device_mouse_x(0);	
	var my = device_mouse_y(0);	
	
	return point_in_circle(mx,my, x_,y_, radius);
}