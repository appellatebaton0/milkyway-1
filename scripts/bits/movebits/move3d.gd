@abstract class_name MoveBit2D extends MoveBit

## The state machine this belongs to.
@onready var master:MoveMasterBit2D = get_master()
func get_master() -> MoveMasterBit2D:
	var parent = get_parent()
	if parent is MoveMasterBit2D:
		return parent
	return null