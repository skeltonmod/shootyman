extends Node2D

onready var muzzle_flash = $AnimationPlayer

func _ready():
	muzzle_flash.play("muzzle")
	muzzle_flash.connect("animation_finished",self,"destroy")

func destroy(animation):
	queue_free()
