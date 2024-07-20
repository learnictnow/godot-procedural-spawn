extends Node3D

@export var game_tile : PackedScene
@export var tile_size = 10

@export var game_tiles:Array[Node3D]


var game_origin

# Called when the node enters the scene tree for the first time.
func _ready():
	$GameTile.exit_east.connect(_on_east_exit)
	$GameTile.exit_west.connect(_on_west_exit)
	$GameTile.exit_north.connect(_on_north_exit)
	$GameTile.exit_south.connect(_on_south_exit)
	
	game_origin = $GameTile.global_position
	
	game_tiles.append($GameTile)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_east_exit(global_pos):
	#if global_pos + Vector3(tile_size,0,0) == game_origin:
		#$GameTile.west.queue_free()
		#return
	var tmp_tile = game_tile.instantiate()

	for tile in game_tiles:
		if tile.global_position == global_pos + Vector3(tile_size,0,0):
			print("Tile exists")
			return

	add_child(tmp_tile)
	tmp_tile.position = global_pos + Vector3(tile_size,0,0)
	
	tmp_tile.exit_east.connect(_on_east_exit)
	tmp_tile.exit_west.connect(_on_west_exit)
	tmp_tile.exit_north.connect(_on_north_exit)
	tmp_tile.exit_south.connect(_on_south_exit)
	
	#tmp_tile.west.queue_free()
	
	game_tiles.append(tmp_tile)
	
	print("Exit")
	
func _on_west_exit(global_pos):
	#if global_pos + Vector3(-tile_size,0,0) == game_origin:
		#$GameTile.east.queue_free()
		#return
	
	for tile in game_tiles:
		if tile.global_position == global_pos + Vector3(-tile_size,0,0):
			print("Tile exists")
			return
	
	var tmp_tile = game_tile.instantiate()

	add_child(tmp_tile)
	tmp_tile.position = global_pos + Vector3(-tile_size,0,0)
	
	tmp_tile.exit_east.connect(_on_east_exit)
	tmp_tile.exit_west.connect(_on_west_exit)
	tmp_tile.exit_north.connect(_on_north_exit)
	tmp_tile.exit_south.connect(_on_south_exit)
	
	#tmp_tile.east.queue_free()
	game_tiles.append(tmp_tile)
	
func _on_north_exit(global_pos):
	#if global_pos + Vector3(0,0,-tile_size) == game_origin:
		#$GameTile.south.queue_free()
		#return
		
	for tile in game_tiles:
		if tile.global_position == global_pos + Vector3(0,0,-tile_size):
			print("Tile exists")
			return
		
	var tmp_tile = game_tile.instantiate()

	add_child(tmp_tile)
	tmp_tile.position = global_pos + Vector3(0,0,-tile_size)
	
	tmp_tile.exit_east.connect(_on_east_exit)
	tmp_tile.exit_west.connect(_on_west_exit)
	tmp_tile.exit_north.connect(_on_north_exit)
	tmp_tile.exit_south.connect(_on_south_exit)
	
	#tmp_tile.south.queue_free()
	game_tiles.append(tmp_tile)
	
func _on_south_exit(global_pos):
	#if global_pos + Vector3(0,0,tile_size) == game_origin:
		#$GameTile.north.queue_free()
		#return
	for tile in game_tiles:
		if tile.global_position == global_pos + Vector3(0,0,tile_size):
			print("Tile exists")
			return
	
	var tmp_tile = game_tile.instantiate()

	add_child(tmp_tile)
	tmp_tile.position = global_pos + Vector3(0,0,tile_size)
	
	tmp_tile.exit_east.connect(_on_east_exit)
	tmp_tile.exit_west.connect(_on_west_exit)
	tmp_tile.exit_north.connect(_on_north_exit)
	tmp_tile.exit_south.connect(_on_south_exit)
	
	#tmp_tile.north.queue_free()
	game_tiles.append(tmp_tile)
