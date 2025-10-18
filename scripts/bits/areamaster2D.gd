class_name AreaMasterBit2D extends Bit
## Provides an Area2D for AreaBits, and handles their ability to have their own layers :D

var area:Area2D = get_area()
func get_area() -> Area2D:
	var me = self
	if me is Area2D:
		return me
	
	var parent = get_parent()
	if parent is Area2D:
		return parent
	
	return null

func layer_match(object_a:Object):
	pass
