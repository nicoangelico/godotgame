extends Character

onready var nav_2d : Navigation2D = get_node("/root/Main/Navigation2D")
onready var player = get_node("/root/Main/Player")
var path : = PoolVector2Array()

func _on_ShootTimer_timeout() -> void:
	#self._shoot()
	pass

#Procesa 1 vez por frame
func _physics_process(delta):
#	var dir = (player.global_position - self.global_position).normalized()
#	move_and_collide(dir * speed * delta)
	var move_distance = speed * delta
	move_along_path(move_distance)

#Una vez por segundo recalculo el camino hacia el player
func _on_PathTimer_timeout():
	path = nav_2d.get_simple_path(self.global_position, player.global_position)

func move_along_path(distance: float) -> void:
	var start_point : = position
	for i in range(path.size()):
		var distance_to_next : = start_point.distance_to(path[0])
		if distance <= distance_to_next and distance >= 0.0:
			position = start_point.linear_interpolate(path[0], distance / distance_to_next)
			break
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)
		



