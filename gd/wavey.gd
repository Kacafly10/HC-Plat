extends Container

@export var maxD = Vector2(600, 300)
var totalD = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	totalD.resize(12)
	totalD.fill(Vector2.ZERO)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("yes")
	var waves = [$w0, $w1, $w2, $w3, $w4, $w5, $w6, $w7, $w8, $w9, $w10, $w11]
	
	var i=0
	for wave in waves:
		totalD[i] += moveWave(wave, totalD, delta, i)
		#print(totalD[i])
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
	
