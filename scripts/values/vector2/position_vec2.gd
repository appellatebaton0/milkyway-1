class_name PositionVector2 extends Vector2Value
## Returns the position of a Node2D

## The node to use.
@export var node:NodeValue
## Whether to use the local or global position.
@export var local := false

func _ready() -> void:
	if node == null:
		for child in get_children():
			if child is NodeValue:
				node = child
				break

func value() -> Vector2:
	if node != null:
		var res_node = node.value()
		if res_node is Node2D:
			return res_node.global_position if not local else res_node.position
	return Vector2.ZERO
