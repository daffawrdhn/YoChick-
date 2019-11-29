extends SkeletonIK

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var hot

onready var stars = get_node("Star")

onready var animation_fan = get_node("fan_button/fan_animation")
onready var animation_lamp = get_node("lamp_button/lamp_animation")

onready var level_food = get_node("food/food_level")
onready var level_water = get_node("water/water_level")

onready var status_food = get_node("Status/food")
onready var status_water = get_node("Status/water")
onready var status_cold = get_node("Status/cold")
onready var status_hot = get_node("Status/hot")

onready var one = get_node("Question/One/")
onready var one_question = get_node("Question/One/AnimatedSprite")
onready var one_timer = get_node("Question/One/Timer")
onready var one_start = get_node("Question/One/Start")

onready var over_panel = get_node("Over/AnimatedSprite")
onready var over_t = get_node("Over/OverTimer")
onready var over_exit = get_node("Over/Exit")



# Called when the node enters the scene tree for the first time.
func _ready():
	GLOBALVAR.set_alat(false)
	
	GLOBALVAR.set_water(false)
	GLOBALVAR.set_food(false)
	GLOBALVAR.set_fan(false)
	GLOBALVAR.set_lamp(false)
	
	print("DEBUG MODE: play_level_one")
	print("alat : ", GLOBALVAR.alat)
	print("water: ", GLOBALVAR.water)
	print("food: ", GLOBALVAR.food)
	print("fan: ", GLOBALVAR.fan)
	print("lamp: ", GLOBALVAR.lamp)
	print("debug : ", GLOBALVAR.debug)
	

	GLOBALVAR.stage_level_one = 0
	GLOBALVAR.level_one_star_one = false
	GLOBALVAR.Bfood = 100
	GLOBALVAR.Bwater = 100
	
	mulai(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	level_food.value = GLOBALVAR.Bfood
	level_water.value = GLOBALVAR.Bwater
	
	#print(GLOBALVAR.level_one_star_one , GLOBALVAR.level_one_star_two)
	
	
	if GLOBALVAR.level_one_star_one == true:
		stars.play("three")
		one_food.stop()
		GLOBALVAR.level_one = 3
		GLOBALVAR.stage_level_one = 3
		

	if GLOBALVAR.Bfood > 75:
		status_food.play("default")
	elif GLOBALVAR.Bfood < 75:
		status_food.play("on")
	elif GLOBALVAR.Bfood == 0:
		status_food.play("default")
		
	if GLOBALVAR.Bwater > 75:
		status_water.play("default")
	elif GLOBALVAR.Bwater < 75:
		status_water.play("on")
	elif GLOBALVAR.Bwater == 0:
		status_water.play("default")
	
	if hot == true:
		status_hot.play("on")
	pass

func mulai(value):
	if value == 1:
		print("Question 1 Dimulai !")
		one_timer.start()
		one_start.hide()
		over_exit.hide()
	if value == 0:
		over_t.start()
		


func _on_fan_button_toggled(button_pressed):
	if button_pressed:
		hot = false
		GLOBALVAR.level_one_star_three = true
		GLOBALVAR.set_fan(true)
		print("fan: ", GLOBALVAR.fan)
		animation_fan.play("default")
	else:
		GLOBALVAR.level_one_star_three = false
		GLOBALVAR.set_fan(false)
		print("fan: ", GLOBALVAR.fan)
		animation_fan.play("off")
	pass # Replace with function body.


func _on_lamp_button_toggled(button_pressed):
	if button_pressed:
		GLOBALVAR.set_lamp(true)
		print("lamp: ", GLOBALVAR.lamp)
		animation_lamp.play("on")
	else:
		GLOBALVAR.set_lamp(false)
		print("lamp: ", GLOBALVAR.lamp)
		animation_lamp.play("off")
		
	pass # Replace with function body.


func _on_lamp2_button_toggled(button_pressed):
	if button_pressed:
		GLOBALVAR.set_lamp(true)
		print("lamp: ", GLOBALVAR.lamp)
		animation_lamp.play("on")
	else:
		GLOBALVAR.set_lamp(false)
		print("lamp: ", GLOBALVAR.lamp)
		animation_lamp.play("off")
		
	pass # Replace with function body.

func _on_Timer_timeout():
	print("question one showed up")
	one_start.show()
	one_question.play("question")
	pass # Replace with function body.



onready var one_food = get_node("Question/One/Timer/Food")
func _on_Start_pressed():
	one_question.play("default")
	one_start.hide()
	one_food.start()
	mulai(0)
	pass # Replace with function body.


func _on_Food_timeout():
	GLOBALVAR.Bfood -= 5
	print("Food left: ", GLOBALVAR.Bfood)
	pass # Replace with function body.


func _on_OverTimer_timeout():
	print("Question 1 Over!")
	if GLOBALVAR.level_one_star_one == true:
		over_panel.play("three")
		over_exit.show()
	pass # Replace with function body.

func reload(value):
	if value == 1:
		print("RELOAD!")

func exit(value):
	if value == 1:
		get_tree().change_scene("res://scene/stage_select_one.tscn")
		

func _on_Exit_pressed():
	exit(1)
	reload(1)
	pass # Replace with function body.
