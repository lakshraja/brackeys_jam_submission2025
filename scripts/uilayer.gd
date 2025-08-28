extends CanvasLayer

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func update_ui():
	get_node("Score").text = str(get_parent().biscuit_count)
	
func ui_pause_pressed():
	get_node("PauseMenu").visible=not get_node("PauseMenu").visible
