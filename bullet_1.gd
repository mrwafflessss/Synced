extends Area2D

@export var SPEED = 950 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2.RIGHT.rotated(rotation) * SPEED * delta)
	
	


#func _on_body_entered(body):
	#if body.is_in_group("enemy") and body.has_method("take_damage"):
		#body.take_damage(WeaponBullet.bullet_damage)
