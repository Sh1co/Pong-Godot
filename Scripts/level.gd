extends Node2D

signal game_ended

export(PackedScene) var ball_ps
export var winning_points = 7

var p1_points = 0
var p2_points = 0

func _ready():
	$HUD.show_message("Get ready!")
	$BallSpawnDelay.start()
	$Goal1.connect("goal_scored", self, "_point_scored")
	$Goal2.connect("goal_scored", self, "_point_scored")
	
func _point_scored(goal):
	if goal == 1:
		p2_points+=1
		$HUD.update_p2_score(p2_points)
		if(p2_points==winning_points):
			$HUD.show_message("P2 won!")
			$GameEndDelay.start()
			return
		$HUD.show_message("P2 scored a point!")
	elif goal == 2:
		p1_points+=1
		$HUD.update_p1_score(p1_points)
		if(p1_points==winning_points):
			$HUD.show_message("P1 won!")
			$GameEndDelay.start()
			return
		$HUD.show_message("P1 scored a point!")
	$BallSpawnDelay.start()
	


func _spawn_ball():
	$HUD.hide_messge()
	var ball = ball_ps.instance()
	ball.position = $BallSpawnPosition.position
	add_child(ball)
	
func end_game():
	emit_signal("game_ended")
