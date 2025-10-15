@abstract class_name Bit extends Bot
## A bot with extended functionality, that can pass that functionality 
## off to its parent if that parent is an Bot.

## The bot to pass the functionality off to.
@onready var bot:Bot = get_bot()
func get_bot() -> Bot:
	var parent = get_parent()
	
	if parent is Bot:
		return parent
	
	return self
