extends CharacterBody2D

@onready var direction = Vector2.ZERO
@export var SPEED = 180.0
@export var ACCELERATION = 20.0
@export var FRICTION = 10.0
const BULLET_1 = preload("res://bullet_1.tscn")
@onready var world = get_node('/root/World')
@onready var sprite = $AnimatedSprite2D


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left","right","up","down").normalized()
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
		
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true

	move_and_slide()


func _on_bullet_timer_timeout():
	var bullet = BULLET_1.instantiate()
	bullet.global_position = global_position
	bullet.rotate(direction.angle())
	world.add_child(bullet)


func _on_pickup_zone_area_entered(area):
	if area.is_in_group("Pickup"):
		if area.has_method("collect"):
			area.collect()
			
			
