extends Node2D

func _ready():
	
	$AnimationPlayer.play("Fade in")
	Wait(get_tree().create_timer(6), "timeout")
	$AnimationPlayer.play("Fade out")
	Wait(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res//MainMenu.tscn")
