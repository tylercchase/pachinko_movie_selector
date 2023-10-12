extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	%StartButton.pressed.connect(on_start_pressed)
	pass # Replace with function body.

func on_start_pressed():
	get_tree().change_scene_to_file("res://src/main.tscn")

func _process(delta):
	pass
