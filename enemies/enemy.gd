extends KinematicBody2D

onready var screen_shake = get_tree().get_current_scene().get_node("Camera2D/screenshake")
onready var flash = get_tree().get_current_scene().get_node("screenflash")
onready var animplayer = $AnimationPlayer
onready var sprite = $AnimatedSprite
onready var collision = $CollisionShape2D
const gibles = preload("res://enemies/giblets.tscn")
var motion = Vector2.ZERO
var dir = 1
const speed = 90
const fall_mult = 2
const fall_height = 95
const fall_apex = 0.4
var jump_force 
var health = 3
var dead = false
var gravity 

func _ready():
	animplayer.play("default")
	pass 

func _physics_process(delta):
	if is_on_wall():
		dir = dir * -1
		sprite.scale.x = dir
		collision.scale.x = dir
	gravity = (2 * fall_height) / pow(fall_apex,2)
	motion.y += gravity *  delta * (fall_mult if motion.y > 0 else 1)
	motion.x =  dir * speed 
	motion.x = clamp(motion.x, -speed, speed)
	motion = move_and_slide(motion,Vector2.UP)
	if health <= 0:
		flash.flash()
		flash.visible = true
		spawn_giblets()
	pass

func hit():
	screen_shake.start()
	animplayer.play("hit")
	health -= 1
	$Timer.start()

func spawn_giblets():
	collision.call_deferred("set_disabled",true)
	for i in range(5):
		var gib_instance = gibles.instance()
		get_parent().add_child(gib_instance)
		gib_instance.spawn(dir * -1)
		gib_instance.global_position = global_position
	queue_free()

func _on_Timer_timeout():
	animplayer.play("default")
	$Timer.stop()
	pass # Replace with function body.
