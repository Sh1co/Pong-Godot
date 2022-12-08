extends Node2D


export(PackedScene) var pvp_level
export(PackedScene) var pve_level

var level = null

func _spawn_level(level_ps):
	level = level_ps.instance()
	level.connect("game_ended", self, "_level_complete")
	add_child(level)
	$MainMenu.visible = false
	
func _level_complete():
	$MainMenu.visible = true
	level.queue_free()
	
func _start_pvp_level():
	_spawn_level(pvp_level)

func _start_pve_level():
	_spawn_level(pve_level)
	
func _exit_game():
	get_tree().quit()
