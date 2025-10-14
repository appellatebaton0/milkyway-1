@abstract class_name Bit extends Bot
## A bot with extended functionality, that passes that functionality 
## off to its parent if that parent is an Bot.

## The ID of the bit, aka its class_name as a String.
@onready var id:String = get_script().get_global_name()

## The bot this bit belongs to, if it exists.
@onready var bot:Bot = get_bot()
func get_bot() -> Bot:
	var parent = get_parent()
	
	if parent is Bot:
		return parent
	
	return null
