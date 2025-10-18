class_name ValueModifierBit extends Bit
## Changes the value of a ValueBit to a new value.

## The Bot to change the value on.
@export var target:NodeValue
## The ID of the ValueBit IN the bot to look for.
@export var value_id:String
## The value to change it to.
@export var new_value:Value

## For signals that are STUPID.
func modify_val(_value):
	modify()

## Can be attached to signals >:)
func modify():
	if target != null and new_value != null:
		var target_node = target.value()
		var next_value = new_value.value()
		
		if target_node is Bot:
			if target_node is ValueBit:
				if target_node.id == value_id:
					target_node.value = next_value
					return
			
			for child in target_node.get_children():
				if child is ValueBit:
					if child.id == value_id:
						child.value = next_value
						return
