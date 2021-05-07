extends CanvasLayer
signal media
signal dificil

func _ready():
	$Dificil.hide()
	$Media.hide()

func _on_Media_pressed():
	emit_signal("media")


func _on_Dificil_pressed():
	emit_signal("dificil")
