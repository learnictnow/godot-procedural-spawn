extends Node3D

@export var block_scene : PackedScene
@export var min_x_spawn = -4
@export var max_x_spawn = 4
@export var min_z_spawn = -4
@export var max_z_spawn = 4
@export var min_y_spawn = 1
@export var max_y_spawn = 1
@export var max_blocks = 10

signal exit_north
signal exit_east
signal exit_south
signal exit_west

@onready var west = $Area3DWest
@onready var east = $Area3DEast
@onready var north = $Area3DNorth
@onready var south = $Area3DSouth

# Called when the node enters the scene tree for the first time.
func _ready():
	for count in range(0, max_blocks):
		var tmp_block = block_scene.instantiate()
		
		add_child(tmp_block)
		tmp_block.position = global_position + Vector3(randi_range(min_x_spawn, max_x_spawn),
		randi_range(min_y_spawn, max_y_spawn),randi_range(min_z_spawn, max_z_spawn))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_3d_west_body_entered(body):
	if body.is_in_group("Player"):
		exit_west.emit(global_position)
		$Area3DWest.queue_free()
	pass # Replace with function body.


func _on_area_3d_east_body_entered(body):
	if body.is_in_group("Player"):
		exit_east.emit(global_position)
		$Area3DEast.queue_free()
	pass # Replace with function body.


func _on_area_3d_north_body_entered(body):
	if body.is_in_group("Player"):
		exit_north.emit(global_position)
		$Area3DNorth.queue_free()
	pass # Replace with function body.


func _on_area_3d_south_body_entered(body):
	if body.is_in_group("Player"):
		exit_south.emit(global_position)
		$Area3DSouth.queue_free()
	pass # Replace with function body.
