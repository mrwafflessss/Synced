extends Node2D
@onready var spawn_points = $spawnpoints2.get_children()
@onready var spawn_timer = $spawntimer2
@onready var world = get_node("/root/World")
@onready var camera = $".."
const enemy_mushroom = preload("res://enemy_zombie.tscn")
func spawn_enemy():
	var enemy =  enemy_mushroom.instantiate()
	var spawn_point = spawn_points.pick_random()
	enemy.global_position = spawn_point.global_position
	world.add_child(enemy)
	
	





func _on_spawntimer_2_timeout():
	spawn_enemy()
