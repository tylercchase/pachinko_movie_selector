class_name MovieBall
extends RigidBody3D

@export var movie_name: String = ''


func _ready():
	%MovieLabel.text = movie_name
