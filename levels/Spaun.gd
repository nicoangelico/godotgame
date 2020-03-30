extends Node2D

const enemy = preload("res://characters/enemy/enemy.tscn")
#onready var parent = self.get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_TimeSpaun_timeout():
	var enemy_instance = enemy.instance()
	enemy_instance.position = get_global_position()
	get_tree().get_root().add_child(enemy_instance)
