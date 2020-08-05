extends KinematicBody2D

var velocity = Vector2(0, 0)
var jumpCount = 0
var onGround = true

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

	#if not is_on_floor():
		#$NinSprite.play("jump")
		
	if Input.is_action_just_pressed("ui_select"):
		if jumpCount < 1:
			jumpCount += 1
			velocity.y = JUMPFORCE
			onGround = false
			
	if is_on_floor():
		onGround = true
		jumpCount = 0
	else:
		onGround = false
		if velocity.y < 0:
			$NinSprite.play("jump")
		
			
