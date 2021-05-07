extends Area2D

export (int) var Velocidad
var Movimiento = Vector2()
var Limite
signal Golpe

func _ready():
	hide() #Ocultar personaje
	Limite = get_viewport_rect().size #Guarda el valor de la pantalla


func _process(delta):
	Movimiento = Vector2() #Reiniciar valor de mov
	if Input.is_action_pressed("ui_right"):
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_down"):
		Movimiento.y += 1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y -= 1
	if Movimiento.length() > 0:
		Movimiento = Movimiento.normalized() * Velocidad
		
	position += Movimiento * delta #Actualizar los movimeintos
	position.x = clamp(position.x,0,Limite.x)
	position.y = clamp(position.y,0,Limite.y)



# warning-ignore:unused_argument
func _on_Player_body_entered(body): #Golpe con cuerpo
	hide()
	emit_signal("Golpe")
	$CollisionP.disabled = true

func Inicio(pos):
	position = pos
	show() #Mostrar personaje
	$CollisionP.disabled = false
