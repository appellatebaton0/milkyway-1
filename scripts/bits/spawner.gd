class_name SpawnerBit extends Bit
## Spawns nodes from PackedScenes, with configurable intervals.

## The node to add new spawns to.
@export var parent:NodeValue
## The PackedScene to use
@export var scene:PackedSceneValue
## The position to spawn the nodes at
@export var spawn_position:Vector2Value
## The rotation to spawn the nodes with (degrees).
@export var spawn_rotation:FloatValue



## Attempt to create and return a new node.
func spawn_new() -> Node:
	# Define the variables 
	var parent_v:Node
	var scene_v:PackedScene
	var position_v:Vector2
	var rotation_v:float
	
	# Attempt to set them
	if parent != null:
		parent_v = parent.value()
	else:
		parent_v = self
	
	if scene != null:
		scene_v = scene.value()
	if scene_v == null:
		return null # Can't make a node from nothing :(
	
	if spawn_position != null:
		position_v = spawn_position.value()
	elif is_class("Node2D"):
		position_v = self.global_position
	elif bot.is_class("Node2D"):
		position_v = bot.global_position
	else:
		position_v = Vector2.ZERO
	
	if spawn_rotation != null:
		rotation_v = spawn_rotation.value()
	elif is_class("Node2D"):
		rotation_v = self.rotation
	elif bot.is_class("Node2D"):
		rotation_v = bot.rotation
	else:
		rotation_v = 0.0
	
	# Now that all the values FINALLY exist, make and return the node;
	
	var new:Node = scene_v.instantiate()
	
	parent_v.add_child(new)
	
	if new is Node2D:
		new.global_position = position_v
		new.rotation = rotation_v
	
	return new
