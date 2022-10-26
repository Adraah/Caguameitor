extends CanvasLayer

signal iniciar_juego
signal iniciar_skins
signal iniciar_dificultad

func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()

func Game_Over():
	mostrar_mensaje("Game Over")
	yield($MensajeTimer, "timeout")
	$Button.show()
	$Skins.show()
	$Dificultad.show()
	$Mensaje.text = "Fin del juego"
	$Mensaje.show()

func update_score(Puntos):
	$ScoreLabel.text = str(Puntos)


func _on_MensajeTimer_timeout():
	$Mensaje.hide()


func _on_Button_pressed():
	$Button.hide()
	$Skins.hide()
	$Dificultad.hide()
	$Mensaje.show()
	$ScoreLabel.show()
	emit_signal("iniciar_juego")


func _on_Skins_pressed():
	$Skins.hide()
	$Mensaje.hide()
	$ScoreLabel.hide()
	emit_signal("iniciar_skins")


func _on_Dificultad_pressed():
	$Dificultad.hide()
	$Mensaje.hide()
	$ScoreLabel.hide()
	emit_signal("iniciar_dificultad")
