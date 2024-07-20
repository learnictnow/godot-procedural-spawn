extends Node3D


@export var width_in_tiles = 5
@export var height_in_tiles = 7
@export var tile_size = 10

@export var game_tiles:Array[Node3D]

@export var game_tile : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	for row in range(0,height_in_tiles):
		for col in range(0,width_in_tiles):
			print("Tilepos: " + str(row) + " : " + str(col))
			var tmp_tile = game_tile.instantiate()
			tmp_tile.position = position + Vector3(col * tile_size, 0, row * tile_size)
			add_child(tmp_tile)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
