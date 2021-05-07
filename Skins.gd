extends CanvasLayer
signal skin_drim
signal skin_toto

func _ready():
	$Drim.hide()
	$Toto.hide()
	$Button2.hide()
	$Button3.hide()


func Skin_toto():
	emit_signal("skin_toto")


func Skin_drim():
	emit_signal("skin_drim")
