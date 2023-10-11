class_name FinishArea
extends Area3D

signal movie_selected


# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body):
	if not body is MovieBall:
		return
	movie_selected.emit(body.movie_name)