extends KinematicBody2D

var velocity = Vector2(0, 0)

const GRAVITY = 35
const SPEED = 300
const JUMPFORCE = - 750

func _physics_process(delta):
	
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$NinSprite.play("run")
		$NinSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = - SPEED
		$NinSprite.play("run")
		$NinSprite.flip_h = true
	else:
		$NinSprite.play("idle")
		velocity.x = 0

	if not is_on_floor():
		$NinSprite.play("jump")
		
	if Input.is_action_just_pressed("ui_select"):
		velocity.y = JUMPFORCE
