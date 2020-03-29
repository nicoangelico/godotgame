extends Character
class_name Player
"""
Base player class. Gives the player the ability to move
"""

func _ready() -> void:
	make_gui()
	print(self.get_path()) 


func make_gui() -> void:
	$"Camera2D".make_current()
	$"CanvasLayer/GUI".visible = true


func _process(delta: float) -> void:
	pass


func get_input() -> void:
	#Create controlable Vector2 for player movement input
	velocity = Vector2()
	var angle = self.rotation * -1
	#print(angle)
	#Change movement Vector2 variables on player input
	if Input.is_action_pressed('player_move_right'):
		velocity = velocity + Vector2(cos(angle + rad2deg(90)), -sin(angle + rad2deg(90)))
	if Input.is_action_pressed('player_move_left'):
		velocity = velocity + Vector2(-cos(angle + rad2deg(90)), sin(angle + rad2deg(90)))
	if Input.is_action_pressed('player_move_down'):
		velocity = velocity + Vector2(-cos(angle), sin(angle))
	if Input.is_action_pressed('player_move_up'):
		velocity = velocity + Vector2(cos(angle), -sin(angle))
	#Normalize player movement input to make sure speed is constant
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)
	#Player looks at mouse
	self.look_at(get_global_mouse_position())


func _physics_process(delta: float) -> void:
	get_input()
