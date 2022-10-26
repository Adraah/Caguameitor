extends CanvasLayer
signal skin_Drim
signal skin_Toto

func _ready():
	$Drim.hide()
	$Toto.hide()
	$Button2.hide()
	$Button3.hide()


func Skin_toto():
	emit_signal("skin_Toto")


func Skin_drim():
	emit_signal("skin_Drim")
