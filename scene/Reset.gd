extends TextureButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Reset_pressed():
	GLOBALVAR.tutor_1 = 0
	GLOBALVAR.tutor_2 = 0
	GLOBALVAR.one = 0
	GLOBALVAR.two = 0
	GLOBALVAR.three = 0
	GLOBALVAR.four = 0
	GLOBALVAR.start = 0
	get_tree().change_scene("res://scene/main.tscn")
	pass # Replace with function body.
