extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var level_one_star = get_node("Node/Level/Level_one/AnimatedSprite")
onready var level_two_star = get_node("Node/Level/Level_two/AnimatedSprite")
onready var one_star = get_node("Node2/Level/Level_one_one/AnimatedSprite")
onready var two_star = get_node("Node2/Level/Level_two_one/AnimatedSprite")
onready var three_star = get_node("Node2/Level/Level_three_one/AnimatedSprite")
onready var four_star = get_node("Node2/Level/Level_four_one/AnimatedSprite")
onready var total = get_node("Total_star")
onready var baru = get_node("New/AnimatedSprite")
onready var xxx = get_node("New")
onready var ending = get_node("End/AnimatedSprite")
onready var yyy = get_node("End")


# Called when the node enters the scene tree for the first time.
func _ready():
	if GLOBALVAR.start == 0:
		baru.play("1")
	elif GLOBALVAR.start == 1:
		xxx.hide()
	elif GLOBALVAR.start == 2:
		xxx.hide()
		yyy.show()
		ending.play("1")
	
	total.set_text(str(GLOBALVAR.tutor_1+GLOBALVAR.tutor_2+GLOBALVAR.one+GLOBALVAR.two+GLOBALVAR.three+GLOBALVAR.four))
	
	if GLOBALVAR.tutor_1 == 0:
		level_one_star.play("none")
	if GLOBALVAR.tutor_1 == 1:
		level_one_star.play("one")
	if GLOBALVAR.tutor_1 == 2:
		level_one_star.play("two")
	if GLOBALVAR.tutor_1 == 3:
		level_one_star.play("three")
	
	if GLOBALVAR.tutor_2 == 0:
		level_two_star.play("none")
	if GLOBALVAR.tutor_2 == 1:
		level_two_star.play("one")
	if GLOBALVAR.tutor_2 == 2:
		level_two_star.play("two")
	if GLOBALVAR.tutor_2 == 3:
		level_two_star.play("three")

	if GLOBALVAR.one == 0:
		one_star.play("none")
	if GLOBALVAR.one == 1:
		one_star.play("one")
	if GLOBALVAR.one == 2:
		one_star.play("two")
	if GLOBALVAR.one == 3:
		one_star.play("three")

	if GLOBALVAR.two == 0:
		two_star.play("none")
	if GLOBALVAR.two == 1:
		two_star.play("one")
	if GLOBALVAR.two == 2:
		two_star.play("two")
	if GLOBALVAR.two == 3:
		two_star.play("three")

	if GLOBALVAR.three == 0:
		three_star.play("none")
	if GLOBALVAR.three == 1:
		three_star.play("one")
	if GLOBALVAR.three == 2:
		three_star.play("two")
	if GLOBALVAR.three == 3:
		three_star.play("three")

	if GLOBALVAR.four == 0:
		four_star.play("none")
	if GLOBALVAR.four == 1:
		four_star.play("one")
	if GLOBALVAR.four == 2:
		four_star.play("two")
	if GLOBALVAR.four == 3:
		four_star.play("three")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

onready var testp = get_node("AnimationPlayer")

func _on_Button_pressed():
	testp.play("background-back")
	pass # Replace with function body.


func _on_next_pressed():
	testp.play("ganti2")
	pass # Replace with function body.


func _on_previous_pressed():
	testp.play("ganti1")
	pass # Replace with function body.


func _on_level_one_pressed():
	get_tree().change_scene("res://scene/one.tscn")
	pass # Replace with function body.


func _on_level_two_pressed():
	get_tree().change_scene("res://scene/two.tscn")
	pass # Replace with function body.


func _on_level_three_pressed():
	get_tree().change_scene("res://scene/three.tscn")
	pass # Replace with function body.


func _on_level_four_pressed():
	get_tree().change_scene("res://scene/four.tscn")
	pass # Replace with function body.

var click = 0
onready var baruBtn = get_node("New/newBtn")
func _on_newBtn_pressed():
	if click == 0:
		baru.play("2")
		click += 1
	elif click == 1:
		baru.play("3")
		click += 1
	elif click == 2:
		GLOBALVAR.start = 1
		baru.play("default")
		baru.hide()
		baruBtn.hide()
	pass # Replace with function body.

var endclick = 0
onready var endBtn = get_node("End/endBtn")
func _on_endBtn_pressed():
	if endclick == 0:
		ending.play("2")
		endclick += 1
	elif endclick == 1:
		ending.play("3")
		endclick += 1
	elif endclick == 2:
		get_tree().quit()
	pass # Replace with function body.
