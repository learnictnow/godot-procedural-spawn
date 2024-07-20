extends Node3D

@export var game_tile : PackedScene
@export var tile_size = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	$GameTile.exit_east.connect(_on_east_exit)
	$GameTile.exit_west.connect(_on_west_exit)
	$GameTile.exit_north.connect(_on_north_exit)
	$GameTile.exit_south.connect(_on_south_exit)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_east_exit(global_pos):
	var tmp_tile = game_tile.instantiate()


	add_child(tmp_tile)
	tmp_tile.position = global_pos + Vector3(tile_size,0,0)
	
	tmp_tile.exit_east.connect(_on_east_exit)
	#tmp_tile.exit_west.connect(_on_west_exit)
	tmp_tile.exit_north.connect(_on_north_exit)
	tmp_tile.exit_south.connect(_on_south_exit)
	
	tmp_tile.west.queue_free()
	
	print("Exit")
	
func _on_west_exit(global_pos):
	var tmp_tile = game_tile.instantiate()

	add_child(tmp_tile)
	tmp_tile.position = global_pos + Vector3(-tile_size,0,0)
	
	#tmp_tile.exit_east.connect(_on_east_exit)
	tmp_tile.exit_west.connect(_on_west_exit)
	tmp_tile.exit_north.connect(_on_north_exit)
	tmp_tile.exit_south.connect(_on_south_exit)
	
	tmp_tile.east.queue_free()
	
func _on_north_exit(global_pos):
	var tmp_tile = game_tile.instantiate()

	add_child(tmp_tile)
	tmp_tile.position = global_pos + Vector3(0,0,-tile_size)
	
	tmp_tile.exit_east.connect(_on_east_exit)
	tmp_tile.exit_west.connect(_on_west_exit)
	tmp_tile.exit_north.connect(_on_north_exit)
	#tmp_tile.exit_south.connect(_on_south_exit)
	
	tmp_tile.south.queue_free()
	
func _on_south_exit(global_pos):
	var tmp_tile = game_tile.instantiate()

	add_child(tmp_tile)
	tmp_tile.position = global_pos + Vector3(0,0,tile_size)
	
	tmp_tile.exit_east.connect(_on_east_exit)
	tmp_tile.exit_west.connect(_on_west_exit)
	#tmp_tile.exit_north.connect(_on_north_exit)
	tmp_tile.exit_south.connect(_on_south_exit)
	
	tmp_tile.north.queue_free()
