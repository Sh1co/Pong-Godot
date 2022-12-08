extends RigidBody2D



export var start_speed = 300


var launched = false

func _ready():
	randomize()


func _input(event):
	if event.is_action_pressed("ui_accept") and !launched:
		launched = true
		var velocity = Vector2.RIGHT.rotated(deg2rad(rand_range(-45,45))) * start_speed
		linear_velocity = velocity if int(rand_range(0,9))%2==0 else velocity.rotated(deg2rad(180))
		
