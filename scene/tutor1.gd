extends SkeletonIK

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var hot
var cold
var hungry
var thirsty

onready var stars = get_node("Star")

onready var animation_fan = get_node("fan_button/fan_animation")
onready var animation_lamp = get_node("lamp_button/lamp_animation")

onready var level_food = get_node("food/food_level")
onready var level_water = get_node("water/water_level")
onready var level_hp = get_node("Chicken/chicken_level")

onready var status_food = get_node("Status/food")
onready var status_water = get_node("Status/water")

onready var status_cold = get_node("Status/cold")
onready var timer_cold = get_node("Status/cold/ColdTimer")
onready var status_hot = get_node("Status/hot")
onready var timer_hot = get_node("Status/hot/HotTimer")

onready var one = get_node("Question/One/")
onready var one_question = get_node("Question/One/AnimatedSprite")
onready var one_timer = get_node("Question/One/Timer")
onready var one_start = get_node("Question/One/Start")

onready var over_panel = get_node("Over/AnimatedSprite")
onready var over_t = get_node("Over/OverTimer")
onready var over_exit = get_node("Over/Exit")

onready var hptimer = get_node("Chicken/ChickenHP")

onready var ayam = get_node("Chicken/animasi")

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	GLOBALVAR.set_alat(false)
	GLOBALVAR.set_water(false)
	GLOBALVAR.set_food(false)
	GLOBALVAR.set_fan(false)
	GLOBALVAR.set_lamp(false)
	
	print("DEBUG MODE: play_level_two")
	print("alat : ", GLOBALVAR.alat)
	print("water: ", GLOBALVAR.water)
	print("food: ", GLOBALVAR.food)
	print("fan: ", GLOBALVAR.fan)
	print("lamp: ", GLOBALVAR.lamp)
	print("debug : ", GLOBALVAR.debug)
	
	ayam.play("default")
	animHighlight.play("highlight")
	animWalkthrough.play("tutor11")
	walkthrough = 0
	one_start.hide()
	over_exit.hide()
	
	cold = false
	hot = false
	hungry = false
	thirsty = false
	
	GLOBALVAR.HP = 100
	GLOBALVAR.tutor_1 = 0
	GLOBALVAR.tutor_1_star = false
	GLOBALVAR.Bfood = 100
	GLOBALVAR.Bwater = 100
	GLOBALVAR.makan_ayam = 0
	GLOBALVAR.minum_ayam = 0
	GLOBALVAR.suhu_dingin = 0
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	level_food.value = GLOBALVAR.Bfood
	level_water.value = GLOBALVAR.Bwater
	level_hp.value = GLOBALVAR.HP
	
	#print(GLOBALVAR.level_one_star_one , GLOBALVAR.level_one_star_two)
	
	if GLOBALVAR.makan_ayam == 1:
		GLOBALVAR.tutor_1_star = true
	
	if GLOBALVAR.tutor_1_star == true:
		stars.play("three")
		GLOBALVAR.a_tutor1 = 3
		GLOBALVAR.tutor_1 = 3
		over(1)
		
	if GLOBALVAR.Bfood > 100:
		GLOBALVAR.Bfood = 100
	elif GLOBALVAR.Bfood > 75:
		status_food.play("default")
	elif GLOBALVAR.Bfood < 75:
		status_food.play("on")
	if GLOBALVAR.Bfood < 0:
		over(1)
		
	if GLOBALVAR.Bwater > 100:
		GLOBALVAR.Bwater = 100
	elif GLOBALVAR.Bwater > 75:
		status_water.play("default")
	elif GLOBALVAR.Bwater < 75:
		status_water.play("on")
	if GLOBALVAR.Bwater < 0:
		over(1)
	
	if GLOBALVAR.HP < 30:
		ayam.play("sakit")
	elif GLOBALVAR.HP < 0:
		over(1)
	
	if hot == true:
		cold == false
		if hot == true:
			ayam.play("panas")
		elif GLOBALVAR.HP < 50 && hot == true:
			ayam.play("sakit")
		elif GLOBALVAR.HP > 50 && hot == true:
			ayam.play("panas")
		status_hot.play("on")
		status_cold.play("default")
	elif hot == false:
		status_hot.play("default")
		
		
	if cold == true:
		hot == false
		if cold == true:
			ayam.play("dingin")
		if GLOBALVAR.HP < 50 && cold == true:
			ayam.play("sakit")
		elif GLOBALVAR.HP > 50 && cold == true:
			ayam.play("dingin")
		status_hot.play("default")
		status_cold.play("on")
	elif cold == false:
		status_cold.play("default")
		
	pass

func mulai(value):
	if value == 1:
		randomize()
		print("Question 2 Dimulai !")
		hptimer.start()
		one_timer.start()
		one_start.hide()
		over_exit.hide()
		timer_cold.start(random(100))
		timer_hot.start(random(100))
	if value == 0:
		over_t.start()
		


func _on_fan_button_toggled(button_pressed):
	if button_pressed:
		hot = false
		GLOBALVAR.set_fan(true)
		print("fan: ", GLOBALVAR.fan)
		animation_fan.play("default")
		ayam.play("default")
	else:
		GLOBALVAR.set_fan(false)
		print("fan: ", GLOBALVAR.fan)
		animation_fan.play("off")
	pass # Replace with function body.


func _on_lamp_button_toggled(button_pressed):
	if button_pressed:
		if cold == true:
			GLOBALVAR.suhu_dingin += 1
		cold = false
		GLOBALVAR.set_lamp(true)
		print("lamp: ", GLOBALVAR.lamp)
		animation_lamp.play("on")
		ayam.play("default")
	else:
		GLOBALVAR.set_lamp(false)
		print("lamp: ", GLOBALVAR.lamp)
		animation_lamp.play("off")
		
	pass # Replace with function body.


func _on_lamp2_button_toggled(button_pressed):
	if button_pressed:
		if cold == true:
			GLOBALVAR.suhu_dingin += 1
		cold = false
		GLOBALVAR.set_lamp(true)
		print("lamp: ", GLOBALVAR.lamp)
		animation_lamp.play("on")
		ayam.play("default")
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



onready var one_water = get_node("Question/One/Timer/Water")
onready var one_food = get_node("Question/One/Timer/Food")
func _on_Start_pressed():
	one_question.play("default")
	one_start.hide()
	one_water.start()
	one_food.start()
	mulai(0)
	pass # Replace with function body.


func _on_Water_timeout():
	GLOBALVAR.Bwater -= 0
	pass # Replace with function body.
	
func _on_Food_timeout():
	GLOBALVAR.Bfood -= 5
	pass # Replace with function body.


func _on_OverTimer_timeout():
	print("Tutor 1 Over!")
	over_panel.play("one")
	over_exit.show()
	pass # Replace with function body.

func over(value):
	if value == 1:
		print("Tutorial 1 Over!")
		over_panel.play("none")
		if GLOBALVAR.a_tutor1 == 3:
			over_panel.play("three")
		over_exit.show()
		over_t.stop()


func random(value):
	return rng.randi_range( value, value*rng.randi_range(value-4,value-3))


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


func _on_ColdTimer_timeout():
	randomize()
	cold = true
	print("cold timer")
	timer_cold.start(random(100))
	pass # Replace with function body.


func _on_HotTimer_timeout():
	randomize()
	hot = true
	print("hot timer")
	timer_hot.start(random(100))
	pass # Replace with function body.


func _on_ChickenHP_timeout():
	if GLOBALVAR.Bfood < 50:
		GLOBALVAR.HP -= 0
	elif GLOBALVAR.Bfood > 50:
		GLOBALVAR.HP += 0
	if GLOBALVAR.Bwater < 50:
		GLOBALVAR.HP -= 0
	elif GLOBALVAR.Bwater > 50:
		GLOBALVAR.HP += 0
	if hot == true:
		GLOBALVAR.HP -= 0
	elif hot == false:
		GLOBALVAR.HP += 0
	if cold == true:
		GLOBALVAR.HP -= 0
	elif cold == false:
		GLOBALVAR.HP += 0
	pass

onready var animWalkthrough = get_node("Walkthrough/AnimatedSprite")
onready var btnWalkthrough = get_node("Walkthrough/btnWalkthrough")
onready var animHighlight = get_node("Walkthrough/highlight")
var walkthrough = 0
func _on_btnWalkthrough_pressed():
	if walkthrough == 0:
		walkthrough += 1
		animWalkthrough.hide()
	elif walkthrough == 1:
		animHighlight.play("default")
		animHighlight.hide()
		btnWalkthrough.hide()
		mulai(1)
	pass # Replace with function body.
