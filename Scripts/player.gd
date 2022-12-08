extends RigidBody2D

enum PlayerType { PLAYER_1, PLAYER_2, CPU }

export(PlayerType) var player_type = PlayerType.PLAYER_1
export var speed = 200

var player_code = ""
var velocity = linear_velocity


func _ready():
	if player_type == PlayerType.PLAYER_1:
		player_code = "p1"
	elif player_type == PlayerType.PLAYER_2:
		player_code = "p2"


func _integrate_forces(state):
	if player_code != "":
		velocity = Vector2.ZERO
		if Input.is_action_pressed(player_code + "_up"):
			velocity = Vector2(0, -speed)
		if Input.is_action_pressed(player_code + "_down"):
			velocity = Vector2(0, speed)
		state.linear_velocity = velocity
