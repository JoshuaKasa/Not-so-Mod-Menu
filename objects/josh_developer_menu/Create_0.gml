open_key = vk_f10;
opened = false;

menu_color = c_black;
menu_color2 = c_teal;
highligth_color = c_yellow;
outline_color = make_color_rgb(51,51,51);
amount = 0;

width = display_get_gui_width();
height = display_get_gui_height();

start_x = 0 + 10;
end_x = width - 10;
start_y = 0 + 10;
end_y = height - 10;

cursor = 0;
value_cursor = 0;
val = 0;

sliding = false;
offset_x = 0;

// Options
options = [
	new Option("Template", "click", ["Click me for a message!"], function() { show_message("Hello!"); })
];
length = array_length(options);