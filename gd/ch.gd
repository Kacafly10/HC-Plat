extends CharacterBody2D


@export var speed = 753
@export var jumpVel = 300
@export var gravity = 980/60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float):
	if !is_on_floor():
		velocity.y += gravity 
	if Input.is_action_just_pressed("j"):
		velocity.y -= jumpVel
	
	
	velocity.x = Input.get_axis("move_left", "move_right") * speed
	move_and_slide()

func _process(delta: float) -> void:
	if Input.is_action_pressed("move_right"):
		$w0.play_backwards("default")
		$w1.play_backwards("default")
		$w2.play_backwards("default")
		
	elif Input.is_action_pressed("move_left"):
		$w0.play("default")
		$w1.play("default")
		$w2.play("default")
		
	else:
		$w0.stop()
		$w1.stop()
		$w2.stop()
		
		
