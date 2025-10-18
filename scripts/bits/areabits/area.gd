@abstract class_name AreaBit extends Bit
## Provides functionality to be run by an AreaMaster, with its own mask that has to be met ALONGSIDE the one from the AreaMaster.

func on_body_entered(_body:Node) -> void:
	pass
func on_area_entered(_area:Node) -> void:
	pass

func on_body_exited(_body:Node) -> void:
	pass
func on_area_exited(_area:Node) -> void:
	pass

func while_overlapping_bodies(_bodies:Node) -> void:
	pass
func while_overlapping_areas(_area:Node) -> void:
	pass
