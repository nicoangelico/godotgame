extends Character

onready var nav_2d : Navigation2D = get_node("/root/Main/Navigation2D")
onready var obj = get_node("/root/Main/Player")
var path : = PoolVector2Array()

func _on_ShootTimer_timeout() -> void:
	#self._shoot()
	pass


func _physics_process(delta):
	var dir = (obj.global_position - self.global_position).normalized()
	move_and_collide(dir * speed * delta)
