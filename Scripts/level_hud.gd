extends CanvasLayer


func update_p1_score(new_score):
	$Score1.text = str(new_score) if new_score>10 else "0"+str(new_score)
	
func update_p2_score(new_score):
	$Score2.text = str(new_score) if new_score>10 else "0"+str(new_score)
	
func show_message(message):
	$Message.text = message
	$Message.visible = true

func hide_messge():
	$Message.visible = false
