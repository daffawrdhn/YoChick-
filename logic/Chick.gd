extends Area2D

"""
Removes any overlapping Area2Ds
on user click up 
"""

func _input(event):
	
	if event.is_action_released("ui_touch"):
		for _a in get_overlapping_areas():
			if GLOBALVAR.alat == true:
				print("TEST!")
			elif GLOBALVAR.water == true:
				if GLOBALVAR.Bwater < 70:
					GLOBALVAR.minum_ayam += 1
				GLOBALVAR.level_two_star_one = true
				GLOBALVAR.Bwater += 50
				print("WATER!", GLOBALVAR.level_one_star_one)
			elif GLOBALVAR.food == true:
				if GLOBALVAR.Bfood < 70:
					GLOBALVAR.makan_ayam += 1
				GLOBALVAR.level_one_star_one = true
				GLOBALVAR.Bfood += 50
				print("FOOD!", GLOBALVAR.level_one_star_two)
			elif GLOBALVAR.fan == true:
				print("FAN!")
			elif GLOBALVAR.lamp == true:
				print("LAMP!")
			elif GLOBALVAR.obat == true:
				if GLOBALVAR.HP < 20:
					GLOBALVAR.HP += 60
					GLOBALVAR.minum_obat += 1
				print("OBAT!")