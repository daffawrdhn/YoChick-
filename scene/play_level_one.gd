extends SkeletonIK

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var water = 100
var food = 100
var hot

var Gwater = GLOBALVAR.Bwater
var Gfood = GLOBALVAR.Bwater

onready var stars = get_node("Star")

var status 

onready var animation_fan = get_node("fan_button/fan_animation")
onready var animation_lamp = get_node("lamp_button/lamp_animation")

onready var level_food = get_node("food/food_level")
onready var level_water = get_node("water/water_level")

onready var timer_food = get_node("FoodTimer")
onready var timer_water = get_node("WaterTimer")
onready var timer_hot = get_node("HotTimer")

onready var status_food = get_node("Status/food")
onready var status_water = get_node("Status/water")
onready var status_cold = get_node("Status/cold")
onready var status_hot = get_node("Status/hot")

onready var mission_one = get_node("Mission/one")
onready var mission_two = get_node("Mission/two")
onready var mission_three = get_node("Mission/three")

onready var mission_over = get_node("Mission/over")

onready var play = get_node("Start")
onready var over = get_node("Over")
onready var over_anim = get_node("Over/panel")
onready var over_exit = get_node("Over/exit")

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
	
	over_exit.hide()
	play.show()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	level_food.value = food
	level_water.value = water
	
	#print(GLOBALVAR.level_one_star_one , GLOBALVAR.level_one_star_two)
	
	
	if GLOBALVAR.level_one_star_one == true:
		stars.play("one")
		print("jalankan misi 2")
		mission_two.start()
	if GLOBALVAR.level_one_star_two == true and GLOBALVAR.level_one_star_one == true:
		stars.play("two")
		print("jalankan misi 3")
		mission_three.start()
	if GLOBALVAR.level_one_star_three == true and GLOBALVAR.level_one_star_one == true and GLOBALVAR.level_one_star_two == true:
		stars.play("three")
		print("Tiga bintang 2")

	
	if food > 75:
		status_food.play("default")
	elif food < 75:
		status_food.play("on")
	elif food == 0:
		status_food.play("default")
		
	if water > 75:
		status_water.play("default")
	elif water < 75:
		status_water.play("on")
	elif water == 0:
		status_water.play("default")
	
	if hot == true:
		status_hot.play("on")
	pass



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


func _on_WaterTimer_timeout():
	if water > 0:
		water -= 10
		print("water decreasing: ", water)
	if water < 0:
		water == 0
		print("water empty")
	pass # Replace with function body.


func _on_FoodTimer_timeout():
	if food > 0:
		food -= 10
		print("food decreasing: ", food)
	if food < 0:
		food == 0
		print("water empty")
	pass # Replace with function body.

func _on_HotTimer_timeout():
	print("PANAS SLURRR")
	pass # Replace with function body.

func _on_one_timeout():
	print("mission one started")
	status_water.play("on")
	timer_water.start()
	mission_two.start()
	pass # Replace with function body.


func _on_two_timeout():
	print("mission two started")
	status_food.play("on")
	timer_food.start()
	
	pass # Replace with function body.


func _on_three_timeout():
	print("mission three started")
	hot = true
	status_hot.play("on")
	timer_hot.start()
	
	pass # Replace with function body.


func _on_play_pressed():
	mission_one.start()
	mission_over.start()
	play.hide()
	pass # Replace with function body.



func _on_over_timeout():
	over.show()
	
	if GLOBALVAR.level_one_star_one == true:
		over_anim.play("one")
	if GLOBALVAR.level_one_star_two == true and GLOBALVAR.level_one_star_one == true:
		over_anim.play("two")
	if GLOBALVAR.level_one_star_three == true and GLOBALVAR.level_one_star_one == true and GLOBALVAR.level_one_star_two == true:
		over_anim.play("three")
	
	over_exit.show()
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().change_scene("res://scene/stage_select_one.tscn")	
	pass # Replace with function body.
