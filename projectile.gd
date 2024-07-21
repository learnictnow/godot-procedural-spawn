extends RigidBody3D

@export var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_collide(-transform.basis.z * delta * speed)
	pass



func _on_area_3d_body_entered(body):
	print(body)
	
	pass # Replace with function body.


func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.
