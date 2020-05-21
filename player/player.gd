extends KinematicBody2D


const acceleration = 150
const friction = 0.20
const jump_height = 95
const time_jump_apex = 0.4
const fall_mult = 2
var motion = Vector2.ZERO
var gravity
var jump_force
var can_shoot = false


const bullet = preload("res://player/muzzle_flash.tscn")
onready var screen_shake = get_tree().get_current_scene().get_node("Camera2D/screenshake")
onready var red_screen = get_tree().get_current_scene().get_node("screenflash")
onready var sprite = $AnimSprite
onready var gun = $Gun/Sprite
onready var gun_pos = $Gun/Sprite/Position2D
onready var gun_pos2 = $Gun/Sprite/casings
onready var muzzle_smoke = $Gun/Sprite/Position2D/particle_smoke
onready var animplayer = $AnimationPlayer

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	gun.position = lerp(gun.position, sprite.position, delta * 4)
	do_shooting(delta)
	do_movement(delta)
	

func do_movement(delta):
	gravity = (2 * jump_height) / pow(time_jump_apex,2)
	jump_force = gravity * time_jump_apex
	motion.y += gravity * delta * (fall_mult if motion.y > 0 else 1)
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if x_input != 0:
		gun.position.x = lerp(gun.position.x +(1 if x_input == -1 else -1), sprite.position.x, delta * 2)
		motion.x = x_input * acceleration
		motion.x = clamp(motion.x,-acceleration,acceleration)
		sprite.scale.x = x_input 
		gun.scale.x = x_input 
		
		animplayer.play("run")
	else:
		motion.x = lerp(motion.x,0,friction)
		if is_on_floor():
			animplayer.play("idle")
			pass
	if is_on_floor():
			if Input.get_action_strength("ui_up"):
				motion.y = -jump_force
	else:
		if !is_on_floor():
			animplayer.play("jump")
			gun.position.y = lerp(gun.position.y + (2 if motion.y < 0 else -2), sprite.position.y, delta * (fall_mult if motion.y > 0 else 1))
	gun.position.x = clamp(gun.position.x,-7,7)
	gun.position.y = clamp(gun.position.y,-7,7)
	motion = move_and_slide(motion,Vector2.UP)

func do_shooting(delta):
	var shoot_key = Input.is_action_just_pressed("ui_shoot")
	var bullet_instance = bullet.instance()
	if shoot_key:
		screen_shake.start(0.1,5,5,0)
		gun.add_child(bullet_instance)
		gun.position.x = lerp(gun.position.x + (3.5 if gun.flip_h == true else -3.5), sprite.position.x, delta * 2)
		gun.rotation = rand_range(-0.25,0.25)
		bullet_instance.global_position = gun_pos.global_position
		motion.x = acceleration * (1 if gun.scale.x == -1 else -1)
		muzzle_smoke.emitting = true
		can_shoot = true
		gun_pos.shoot(gun.scale.x)
		gun_pos2.spawn_casing((1 if gun.scale.x == -1 else -1))
	else :
		can_shoot = false
		gun.rotation = lerp(gun.rotation,0,delta * 2)
	pass






func _on_hitbox_body_entered(body):
	if "enemy" in body.name:
		screen_shake.start(0.5,10,40,0)
		red_screen.visible = true
		red_screen.flash(2)
	pass # Replace with function body.
