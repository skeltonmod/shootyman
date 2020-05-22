extends Node

# some new features
var is_shaking = false
var _amplitude = 0.0
var _timer = 0.0
var _duration = 0.0
var _period_in_ms = 0.0
var _last_shook_timer = 0.0
var _prev_x  = 0.0
var _prev_y = 0.0
var _last_offset = Vector2()

onready var camera = get_parent()

func _process(delta):
	if _timer == 0 : return
	_last_shook_timer = _last_shook_timer + delta
	
	while _last_shook_timer >= _period_in_ms:
		_last_shook_timer = _last_shook_timer - _period_in_ms
		var intensity = _amplitude * (1 - ((_duration - _timer) / _duration))
		var new_x = rand_range(-1.0, 1.0)
		var x_component = intensity * (_prev_x + (delta * (new_x - _prev_x)))
		var new_y = rand_range(-1.0,1.0)
		var y_component = intensity * (_prev_y + (delta * (new_y - _prev_y)))
		_prev_x = new_x
		_prev_y = new_y
		var new_offset = Vector2(x_component,y_component)
		camera.offset -= _last_offset - new_offset
		_last_offset = new_offset
	_timer = _timer - delta
	if _timer <= 0:
		_timer = 0
		camera.offset -= _last_offset
		is_shaking = false
	
	pass

func shake(duration,frequency,s_amplitude):
	if is_shaking: return
	_duration = duration
	_timer = duration
	_period_in_ms = 1.0 / frequency
	_amplitude = s_amplitude
	_prev_x = rand_range(-1.0,1.0)
	_prev_y = rand_range(-1.0,1.0)
	camera.offset -= _last_offset
	_last_offset = Vector2(0,0)
	pass

