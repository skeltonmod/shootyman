extends Node

const TRANS = Tween.TRANS_BACK
const EASE = Tween.EASE_OUT

onready var frequency_timer = $Timer
onready var duration_timer = $duration
var priority = 0
var amplitude = 0
onready var camera = get_parent()

func new_shake():
	var rand = Vector2()
	rand.x = rand_range(-amplitude, amplitude)
	rand.y = rand_range(-amplitude, amplitude)
	$Tween.interpolate_property(camera,"offset",camera.offset,rand,frequency_timer.wait_time,TRANS,EASE)
	$Tween.start()

func start(duration = 0.2, frequency = 15,start_amplitude = 16, start_priority = 0):
	if start_priority >= self.priority:
		self.amplitude = start_amplitude
		duration_timer.wait_time = duration
		frequency_timer.wait_time = 1 / float(frequency)
		duration_timer.start()
		frequency_timer.start()
		new_shake()
		pass

func reset():
	$Tween.interpolate_property(camera,"offset",camera.offset,Vector2(),frequency_timer.wait_time,TRANS,EASE)
	$Tween.start()
	priority = 0


func _on_Timer_timeout():
	new_shake()
	pass # Replace with function body.


func _on_duration_timeout():
	reset()
	frequency_timer.stop()
	pass # Replace with function body.
