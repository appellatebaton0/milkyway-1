class_name LerpBit2D extends MoveBit2D
## Lerps between two nodes, with a certain weight.

@export var node_a:NodeValue ## The first node to use.
@export var node_b:NodeValue ## The second node to use.
@export var lerp_amounts:Vector2Value ## The lerp values for the x and y. Lock between 0.0 and 1.0

## Returns the lerp locked between (0,0) and (1,1)
func locked_lerp():
	var lerp_value = lerp_amounts.value()
	return Vector2(1,1).min(Vector2(0,0).max(lerp_value))

func _ready() -> void:
	## Look for the values in the children.
	for child in get_children():
		print("child ", child is NodeValue)
		if child is NodeValue:
			if node_a == null:
				node_a = child
			elif node_b == null:
				node_b = child
		elif child is Vector2Value:
			lerp_amounts = child

func phys_active(_delta:float) -> void:
	print(0)
	if node_a != null and node_b != null:
		print("1")
		var a = node_a.value()
		var b = node_b.value()
		var l = locked_lerp()
		
		# Lerp.
		if a is Node2D and b is Node2D:
			master.mover.global_position = Vector2(lerp(a.global_position.x, b.global_position.x, l.x), lerp(a.global_position.y, b.global_position.y, l.y))
		
