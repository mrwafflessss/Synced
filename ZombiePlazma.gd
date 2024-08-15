extends CharacterBody2D


const SPEED = 65.0
const JUMP_VELOCITY = -200.0
@onready var sprite = $sprite
@onready var player = get_tree().get_first_node_in_group("Player")
const BLOOD = preload("res://blood.tscn")
const ZOMBIE_PLAZMA = preload("res://zombie_plazma.tscn")


func _physics_process(delta):
	var direction_to_player = global_position.direction_to(player.global_position)
	velocity = direction_to_player * SPEED
	
	if velocity.x > 0:
		sprite.flip_h = true
	else:
			sprite.flip_h = false
	
	move_and_slide()


func enemy_die():
	queue_free()
	var new_blood = BLOOD.instantiate()
	new_blood.global_position = global_position
	add_sibling(new_blood)
	var new_gem = ZOMBIE_PLAZMA.instantiate()
	new_gem.global_position = global_position
	add_sibling(new_gem)

