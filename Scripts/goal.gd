extends Area2D

signal goal_scored(goal_number)

export var goal_number = 1

var ball_group = "Ball"


func _on_Goal_body_entered(body):
	if body.is_in_group(ball_group):
		body.queue_free()
		emit_signal("goal_scored", goal_number)
