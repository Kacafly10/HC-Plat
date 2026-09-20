extends Node2D

@export var maxD = Vector2(600, 300)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var waves = [$w0, $w1, $w2, $w3]
	var totalD = []
	totalD.resize(4)
	totalD.fill(Vector2.ZERO)
	
	var i=0
	for wave in waves:
		totalD[i] += moveWave(wave, totalD, delta, i)
		print(totalD[i])
		i += 1
	await get_tree().create_timer(0.5).timeout
	
func moveWave(wave, totalD, delta, i):
	var v = Vector2(randf_range(-100, 100), randf_range(-100, 100))
	if totalD[i] + v > maxD:
		wave.position -= v * delta
		return -v
	else:
		wave.position += v * delta
		return v
	
