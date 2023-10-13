class_name MovieBall
extends RigidBody3D

@export var movie_name: String = ''
var cool_color

func _ready():
	var material = $MeshInstance3D.get_surface_override_material(0)
	cool_color = Color.from_hsv((randi() % 12) / 12.0, 1, 1)
	material.albedo_color =  cool_color
	material = material.duplicate()
	$MeshInstance3D.set_surface_override_material(0, material)
	%MovieLabel.text = movie_name
	#Color.from_hsv((randi() % 12) / 12.0, 1, 1)
