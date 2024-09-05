extends CharacterBody2D


const SPEED = 115.0
const JUMP_VELOCITY = -200.0
@onready var sprite = $sprite
@onready var player = get_tree().get_first_node_in_group("Player")
const BLOOD = preload("res://blood.tscn")
@onready var damage_timer = $"Damage timer"
@export var damage = 5


func check_collision():
	var collisions = $Hurtbox.get_overlapping_bodies()
	if collisions:
		for collision in collisions:
			if collision.is_in_group("Player") and damage_timer.is_stopped(): 
				
				damage_timer.start()
			


@warning_ignore("unused_parameter")
func _physics_process(delta):
	var direction_to_player = global_position.direction_to(player.global_position)
	velocity = direction_to_player * SPEED
	
	if velocity.x > 0:
		sprite.flip_h = true
	else:
			sprite.flip_h = false
	
	move_and_slide()


func enemy_die():
	GameManager.score += 10
	queue_free()
	var new_blood = BLOOD.instantiate()
	new_blood.global_position = global_position
	add_sibling(new_blood)
	
	
	
