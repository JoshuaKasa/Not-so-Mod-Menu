# Not-so-Mod-Menu
A debug tool for your GameMaker Studio 2 projects!

For getting started create a local package while inside the Mod Menu project.
After that you should import the .yymps file into your project.

After that you're all set! You just now want to add all of your options to the Mod Menu.
For doing that, go into the josh_developer_menu object, then go into the create event and inside the **options** array add a new option.

For initializing the options just do:
(inside the options square brackets)
new Option(the name of the otpions you want to display, the type of options ("change" if it's more than 1 value, "click if it's just 1 value), 
            [an array that contains every option name], function () { inside here you wanna put the actual function for when the options is clicked})
            
Click option example:
`new Option("Add 10 health", "click", ["10"], function() { oPlayer.health += 10})`

Change options example:
`new Option("Add gold", "change", [100, 1000, 100000], function () { oPlayer.gold += options[0].values[value_cursor] })`

This might seems kinda hard but it's actually not!
All I'm doing I'm adding to the player gold **oPlayer.gold** whatever the user is pressing on the option **options[0]** the current option **.values** the array containing
all the option values **[value_cursor]** whatever the user is on in the option values.

After this you're actually all set up and ready to use this debug tool! Have fun!
