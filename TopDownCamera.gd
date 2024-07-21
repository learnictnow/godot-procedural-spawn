extends Node3D


@onready var player = get_parent()

var offset : Vector3

func _init():
	set_as_top_level(true)

func _ready():
	offset = player.position - position

func _physics_process(delta):

	position = player.position - offset
