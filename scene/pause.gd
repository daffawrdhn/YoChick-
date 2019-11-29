extends Node
onready var pause = get_node("Sprite")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pause.hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_pause_button_pressed():
	pause.show()
	get_tree().paused = true
	pass # Replace with function body.

func repause():
	get_tree().paused = false
	pass
	

func _on_restart_pressed():
	repause()
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_play_pressed():
	pause.hide()
	get_tree().paused = false
	pass # Replace with function body.


func _on_menu_pressed():
	repause()
	get_tree().change_scene("res://scene/stage_select_one.tscn")
	pass # Replace with function body.
