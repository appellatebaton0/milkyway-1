@abstract class_name Bit extends Bot
## A bot with extended functionality, that can pass that functionality 
## off to its parent if that parent is an Bot.

## The ID of the bit, aka its class_name as a String.
@onready var id:String = get_script().get_global_name()

@export var passing := true ## Whether to pass functionality off to the parent.

## The bot to pass the functionality off to.
@onready var bot:Bot = get_bot()
func get_bot() -> Bot:
	if passing:
		var parent = get_parent()
		
		if parent is Bot:
			return parent
	
	return self
