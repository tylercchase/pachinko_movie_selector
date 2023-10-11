@tool
extends Node3D

@export var peg_scene: PackedScene

@export var amount = 100 :
	set(_amount):
		if _amount != amount:
			amount = _amount
			_update_pegs()

@export var rows = 10 :
	set(_rows):
		if _rows != rows:
			rows = _rows
			_update_pegs()




func _update_pegs():
	for child in get_children():
		child.queue_free()

	for idx in amount:
		var peg : Node3D = peg_scene.instantiate()
		add_child.call_deferred(peg)
		await peg.tree_entered
		var current_row = floor(idx / rows)
		# odd or even row #
		peg.set_global_position(Vector3(
		-50 +  current_row * (3.0 * 2),
		45 - idx % rows * 3.0,
		-2.5))
