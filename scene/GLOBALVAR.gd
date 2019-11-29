extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var kirek = "AWKAY"
var totalS = 0
#checking tool
var alat = false
var start = 0

var water = false
var Bwater = 100
var food = false
var Bfood = 100
var fan = false
var lamp = false
var obat = false
var HP = 100

var level_one = 0
var level_two = 0
var level_three = 0
var level_four = 0

var level_one_star_one = false
var level_one_star_two = false
var level_one_star_three = false

var level_two_star_one = false
var level_two_star_two = false
var level_two_star_three = false

var level_three_star_one = false
var level_three_star_two = false
var level_three_star_three = false

var level_four_star_one = false
var level_four_star_two = false
var level_four_star_three = false

var stage_level_one = 0
var stage_level_two = 0
var stage_level_three = 0
var stage_level_four = 0


var a_tutor1 = 0
var a_tutor2 = 0
var a_one = 0
var a_two = 0
var a_three = 0
var a_four = 0

var tutor_1_star = false
var tutor_2_star = false

var one_star_one  = false
var suhu_dingin = 0
var one_star_two  = false
var makan_ayam = 0
var one_star_three  = false
var minum_ayam = 0

var two_star_one = false
var suhu_panas = 0
var two_star_two = false
var minum_obat = 0
var two_star_three = false

var three_star_one = false
var three_star_two = false
var three_star_three = false

var four_star_one = false
var four_star_two = false
var four_star_three = false

var one = 0
var two = 0
var three = 0
var four = 0
var tutor_1 = 0
var tutor_2 = 0

var debug = false

# Called when the node enters the scene tree for the first time.
func _ready():
	totalS = (GLOBALVAR.tutor_1+GLOBALVAR.tutor_2+GLOBALVAR.one+GLOBALVAR.two+GLOBALVAR.three+GLOBALVAR.four)
	pass # Replace with function body.

func set_alat(value):
	alat = value
	
func set_water(value):
	water = value
	
func set_food(value):
	food = value
	
func set_fan(value):
	fan = value
	
func set_lamp(value):
	lamp = value
	
func set_obat(value):
	obat = value
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
