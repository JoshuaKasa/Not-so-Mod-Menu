if (keyboard_check_pressed(open_key)) then opened = !opened
if (opened == false || length == 0) then exit;

// Drawing design
draw_set_alpha(0.7);
draw_set_color(menu_color);
draw_rectangle(start_x,start_y, end_x,end_y, false);

draw_set_alpha(1);
draw_set_color(outline_color);
draw_rectangle(start_x,start_y, end_x,end_y, true);
draw_rectangle(start_x + 20,start_y + 20, end_x - 20,end_y - 20, true);
draw_set_color(menu_color2);
draw_rectangle(start_x,start_y, start_x + 20,end_y, false);
draw_rectangle(start_x,start_y, end_x,start_y + 20, false);
draw_rectangle(end_x - 20,start_y, end_x,end_y, false);
draw_rectangle(start_x,end_y - 20, end_x,end_y, false);

// Cursors options
if (keyboard_check_pressed(vk_down)) 
{
	cursor++;
	
	val = 0;
	offset_x = 0;
}
else if (keyboard_check_pressed(vk_up)) 
{
	cursor--;
	
	val = 0;
	offset_x = 0;
}
cursor = wrap(cursor, 0, length - 1);

// Cursor values
var on_value = options[cursor].value;
var value_length = array_length(on_value);

if (keyboard_check_pressed(vk_right)) then value_cursor++;
else if (keyboard_check_pressed(vk_left)) then value_cursor--;
value_cursor = wrap(value_cursor, 0,value_length - 1);

// Drawing options
draw_set_font(josh_developer_menu_font);
var start_offset = 40;
var font_size = font_get_size(josh_developer_menu_font);

for (var i = 0; i < length; i++)
{	
	var between = 3;
	var offset = (i * font_size * between);
	var type_x = end_x - start_offset;
	
	if (i == cursor) then draw_set_color(highligth_color);
	else draw_set_color(menu_color2);
	
	draw_set_halign(fa_left);
	draw_text(start_x + start_offset,start_y + start_offset + offset, options[i].name);
	
	draw_set_halign(fa_right);
	if (options[i].type == "change")
	{
		if (i == cursor)
		{
			draw_text(type_x, start_y + start_offset + offset, "< " + string(options[i].value[value_cursor]) + " >");
		}
		else 
		{
			draw_text(type_x, start_y + start_offset + offset, "< " + string(options[i].value[0]) + " >");
		}
	}
	else if (options[i].type == "click")
	{
		draw_text(type_x, start_y + start_offset + offset, string(options[i].value[0]));
	}
	else if (options[i].type == "slider")
	{
		if (i == cursor)
		{
			var GUI_X = device_mouse_x_to_gui(0);
			var position = (type_x - 100) + offset_x;
		
			draw_line(type_x - 100, start_y + start_offset + offset, type_x,start_y + start_offset + offset);
			draw_circle(type_x - 100 + offset_x,start_y + start_offset + offset, 5, false);
			
			if (!mouse_check_button(mb_left)) then sliding = false;
			if (circle_hover(type_x - 100 + offset_x,start_y + start_offset + offset, 5))
			{
				if (mouse_check_button(mb_left))
				{
					sliding = true;	
				}
			}
			if (sliding == true)
			{
				offset_x = GUI_X - (type_x - 100);
				offset_x = clamp(offset_x, 0,100);
			
				val = options[cursor].value[0] + (position - (type_x - 100)) / (type_x - (type_x - 100)) * (options[cursor].value[1] - options[cursor].value[0]);
				val = clamp(val, options[cursor].value[0],options[cursor].value[1]);
			}
		}
		else
		{
			draw_line(type_x - 100, start_y + start_offset + offset, type_x,start_y + start_offset + offset);
			draw_circle(type_x - 100,start_y + start_offset + offset, 5, false);
		}
	}	
}
if (keyboard_check_pressed(vk_enter))
{
	options[cursor].func();	
}

// Closing option
draw_set_color(outline_color);
draw_rectangle(end_x - 17,start_y + 6, end_x - 7,start_y + 16, true);

if (rectangle_hover(end_x - 17,start_y + 6, end_x - 7,start_y + 16) && amount < 1) 
{
	amount += 0.05;
	if (mouse_check_button_pressed(mb_left)) then opened = false;
}
else if (amount > 0) then amount -= 0.05;

draw_set_color(merge_color(outline_color,highligth_color, amount));
draw_line(end_x - 17,start_y + 6, end_x - 7,start_y + 16);
draw_line(end_x - 17, start_y + 16, end_x - 7,start_y + 6);