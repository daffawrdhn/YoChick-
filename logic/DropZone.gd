extends Area2D

"""
Removes any overlapping Area2Ds
on user click up 
"""

func _input(event):
	
	if event.is_action_released("ui_touch"):
		for _a in get_overlapping_areas():
			if GLOBALVAR.alat != true:
				print("TEST!")
				_a.queue_free()
			if GLOBALVAR.water != true:
				print("WATER!")
				_a.queue_free()
			if GLOBALVAR.alat != true:
				print("FOOD!")
				_a.queue_free()