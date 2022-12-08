extends RigidBody2D

enum PlayerType {
	Player1,
	Player2,
	CPU
}


export(PlayerType) var player_type = PlayerType.Player1
export var speed = 200

var player_code = ""

func _ready():
	if player_type == PlayerType.Player1:
		player_code = "p1"
	elif player_type == PlayerType.Player2:
		player_code = "p2"

var velocity = linear_velocity

func _integrate_forces(state):
	if player_code!="":
		velocity = Vector2.ZERO
		if Input.is_action_pressed(player_code + "_up"):
			velocity = Vector2(0, -speed)
		if Input.is_action_pressed(player_code + "_down"):
			velocity = Vector2(0, speed)
		state.linear_velocity = velocity
