extends Node2D
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer



func _ready() -> void:
	audio.play()
