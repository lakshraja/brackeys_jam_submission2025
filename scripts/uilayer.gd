extends CanvasLayer

func _ready() -> void:
	pass

var show_instruction=true
func _process(delta: float) -> void:
	update_ui()
	if not show_instruction:
		get_node("Instruction").visible=false
	
	if get_parent().time>5:
		show_instruction=false
	
func update_ui():
	get_node("Score").text = str(get_parent().biscuit_count)
	#str(get_parent().time)
	var time = int(get_parent().time)
	var counter_label=str("%02d" % int(time/60))+":"+str("%02d" % int(time%60))
	
	get_node("Counter").text=counter_label
	
func ui_pause_pressed():
	get_node("PauseMenu").visible=not get_node("PauseMenu").visible
