class_name MovieBallManager
extends Node3D

@export var movie_ball_scene: PackedScene


signal first_ball_changed

var movie_balls = []
var movie_names = []
var lowest_ball = null

func _ready():
	var file = FileAccess.open("res://movie_list.txt", FileAccess.READ)
	var counter = 0
	while not file.eof_reached():
		var line = file.get_line()
		movie_names.push_back(line)
	movie_names.shuffle()
	for movie in movie_names:
		var new_ball = movie_ball_scene.instantiate()
		new_ball.movie_name = movie
		add_child(new_ball)
		var spacing = counter % 50 * 0.5 + (randf() * 2.0 - 1.0)
		var row = floor(counter / 50)
		new_ball.global_position = Vector3(-25 + spacing * 2, 50 + row * 2 + (randf() * 2.0 - 1.0), -2.5)
		counter += 1
		movie_balls.push_back(new_ball)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var lowest_height = 50000
	var lowest_ball_temp
	for ball in movie_balls:
		if ball.global_position.y < lowest_height:
			lowest_ball_temp = ball
			lowest_height = ball.global_position.y
	if lowest_ball != lowest_ball_temp:
		lowest_ball = lowest_ball_temp
		first_ball_changed.emit(lowest_ball)
