extends Label

var time_left = 600.0  # 600 = 5 minutes in seconds
var timer_active = false

func _process(delta):
	if timer_active:
		time_left -= delta
		if time_left <= 0.0:
			time_left = 0.0
			timer_active = false
			
		update_timer_display()

func start_timer():
	timer_active = true

func stop_timer():
	timer_active = false

func reset_timer():
	time_left = 600.0 # 5 minutes in seconds
	update_timer_display()

func update_timer_display():
	var minutes = int(time_left / 60)
	var seconds = int(time_left) % 60
	var milliseconds = int((time_left - int(time_left)) * 1000)
	text = "%02d:%02d:%02d" % [minutes, seconds, milliseconds]
