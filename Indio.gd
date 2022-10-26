extends RigidBody2D

export (int) var Velocidad_Min
export (int) var Velocidad_Max

func _on_Visibilidad_screen_exited():
	queue_free()  
