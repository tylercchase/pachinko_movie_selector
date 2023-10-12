extends Control

@export var finish_area: FinishArea

var movie_selected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	finish_area.movie_selected.connect(_on_movie_selected)
	visible = false

func _on_movie_selected(movie_name):
	visible = true
	if movie_selected:
		return
	%MovieNameLabel.text = movie_name
	movie_selected = true