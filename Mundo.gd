extends Node

export (PackedScene) var Indio
var Score

func _ready():
	randomize()
	
func nuevo_juego():
	Score = 0
	$Skins2._ready()
	$Dificultad._ready()
	$Player.Inicio($PositionInicio.position)
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje(":(")
	$Interfaz.update_score(Score)
	

func Game_Over():
	$ScoreTimer.stop()
	$IndioTimer.stop()
	$Interfaz.Game_Over()


func _on_InicioTimer_timeout():
	$IndioTimer.start()
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	Score += 1
	$Interfaz.update_score(Score)

func _on_IndioTimer_timeout():
	$Camino/IndioPosition.set_offset(randi())
	var I = Indio.instance()
	add_child(I)
	var D = $Camino/IndioPosition.rotation + PI/2
	I.position = $Camino/IndioPosition.position
	D += rand_range(-PI / 4, PI / 4)
	I.rotation = D
	I.set_linear_velocity(Vector2(rand_range(I.Velocidad_Min,I.Velocidad_Max),0).rotated(D))


func Iniciar_Skins():
	$Skins2/Drim.show()
	$Skins2/Toto.show()
	$Skins2/Button2.show()
	$Skins2/Button3.show()
	$Dificultad/Dificil.hide()
	$Dificultad/Media.hide()


func Skin_Drim():
	$Player/SpriteP.animation = "1"


func Skin_Toto():
	$Player/SpriteP.animation = "2"


func _on_Dificultad_dificil():
	$IndioTimer.wait_time = .2


func _on_Dificultad_media():
	$IndioTimer.wait_time = .5


func _on_Interfaz_iniciar_dificultad():
	$Dificultad/Dificil.show()
	$Dificultad/Media.show()
