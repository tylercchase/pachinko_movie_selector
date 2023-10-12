extends Camera3D

@export var movie_ball_manager: MovieBallManager

var current_ball = null

func _ready():
	movie_ball_manager.first_ball_changed.connect(_on_first_ball_changed)


func _process(delta):
	if not current_ball:
		return
	var tween = create_tween()
	tween.tween_property(self, "global_position", current_ball.global_position + Vector3(0.0,0.0,25.0), 0.5)

func _on_first_ball_changed(ball):
	current_ball = ball
