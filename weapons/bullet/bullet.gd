extends RigidBody2D

onready var parent = self.get_parent()

func _ready() -> void:
	set_as_toplevel(true)

func _on_Bullet_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
	if body.is_in_group("enemy"):
		#body.health -= parent.gun_stats[2]
		#body.health_check()
		body.get_node("Health").health_check(parent.damage)
		print(body.get_node("Health").health)
		queue_free()
	if body.is_in_group("object"):	
		#var explosion_instance = explosion.instance()
		#explosion_instance.position = get_global_position()
		#get_tree().get_root().add_child(explosion_instance)
		queue_free()

#Delete bullet after timer runs out
func _on_Timer_timeout() -> void:
	self.queue_free()

