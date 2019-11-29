extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var fan
onready var animation = get_node("../fan/animation")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func fan(value):
	if value == "On":
		animation.play()
		fan = value
		print(fan)
	else:
		animation.stop()
		fan = value
		print(fan)

func _on_fan_toggled(button_pressed):
	if button_pressed:
		fan("On")
		print(fan)
	else :
		fan("Off")
		print(fan)
	pass # Replace with function body.
