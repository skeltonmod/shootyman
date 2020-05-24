extends KinematicBody2D

onready var screen_shake = get_tree().get_current_scene().get_node("Camera2D/screenshake")
onready var flash = get_tree().get_current_scene().get_node("screenflash")
onready var player = get_tree().get_current_scene().get_node_or_null("player")
onready var animplayer = $AnimationPlayer
onready var sprite = $AnimatedSprite
onready var collision = $CollisionShape2D
onready var score_var = get_node("/root/GlobalsScore")

const gibles = preload("res://enemies/giblets.tscn")
const gibles2 = preload("res://enemies/giblets2.tscn")
const speed = 90
const fall_mult = 2
const fall_height = 95
const fall_apex = 0.4

var enemies_killed = 0
var motion = Vector2.ZERO
var dir = 1
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
		score_var.score += 1
		screen_shake.shake(0.50, 30,20 )
		flash.flash()
		flash.visible = true
		spawn_giblets()
	if GlobalsScore.in_game == false:
		screen_shake.shake(0.50, 30,20)
		spawn_giblets_without_player()
	pass

func hit():
	screen_shake.shake(0.25, 30, 2 )
	animplayer.play("hit")
	health -= 1
#	$Timer.start()

func spawn_giblets():
	collision.call_deferred("set_disabled",true)
	for _i in range(5):
		var gib_instance = gibles.instance()
		var gib_instance2 = gibles2.instance()
		get_parent().add_child(gib_instance)
		get_parent().add_child(gib_instance2)
		gib_instance.spawn(player.sprite.scale.x)
		gib_instance2.spawn(player.sprite.scale.x)
		gib_instance.global_position = global_position
		gib_instance2.global_position = global_position
	queue_free()

func spawn_giblets_without_player():
	collision.call_deferred("set_disabled",true)
	for _i in range(5):
		var gib_instance = gibles.instance()
		var gib_instance2 = gibles2.instance()
		get_parent().add_child(gib_instance)
		get_parent().add_child(gib_instance2)
		gib_instance.spawn(sprite.scale.x)
		gib_instance2.spawn(sprite.scale.x)
		gib_instance.global_position = global_position
		gib_instance2.global_position = global_position
	queue_free()

func _on_Timer_timeout():
#	animplayer.play("default")
#	$Timer.stop()
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "hit":
		animplayer.play("default")
	pass # Replace with function body.
