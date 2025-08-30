extends Node2D

var tracks=["Here.wav", "Arrive.wav", "Beyond.wav", "Beyond.wav", "Itching.wav", "Need You.wav", "Play.wav", "Too Much.wav", "Wayward.wav"]
var track_id=0
var current_scene
var current_track

var biscuit_count=0
var time=0

var is_playing=false
var is_paused=false
signal pause_pressed

func _ready() -> void:
	biscuit_count=0
	time=0
	is_playing=false
	is_paused=false
	get_tree().paused=false
	load_scene("res://scenes/levels/MainMenu.tscn")
	get_node("MainMenu").play_button_pressed.connect(_play_button_pressed)
	
	#load_scene("res://scenes/AudioManager.tscn")
	load_scene("res://scenes/MusicPlayer.tscn")
	
	change_track("Here.wav")


#this guy will load the menu first
#then it will manage all the scenes and levels and also game over window
#it should also manage the ui like the cookie counter

func _process(delta: float) -> void:
	if not is_paused and is_playing: time+=delta
	
	
func _play_button_pressed()->void:
	get_node("MainMenu").queue_free()
	load_scene("res://scenes/UILayer.tscn")
	
	#load_scene("res://scenes/levels/Tutorial.tscn")
	#current_scene = "Tutorial"
	switch_scenes_without_path("EndlessGameMode")
	
	is_playing = true
	
	biscuit_count=0

	pause_pressed.connect($"/root/Main/UILayer".ui_pause_pressed)



func load_scene(scene: String)->void:
	var loaded_scene = load(scene)
	var scene_instance = loaded_scene.instantiate()
	add_child(scene_instance)


func switch_scenes(scene: String, scene_path: String)->void:
	if current_scene: 
		get_node(current_scene).queue_free()
	load_scene(scene_path)
	current_scene=scene
	
func switch_scenes_without_path(scene: String):
	if current_scene: 
		get_node(current_scene).queue_free()
	load_scene("res://scenes/levels/"+scene+".tscn")
	current_scene=scene


func main_on_biscuit_eaten():
	biscuit_count+=1
	get_node("./"+current_scene+"/Player").update_speed(biscuit_count)
	
	
func on_game_over():
	get_tree().paused=true
	is_paused=true
	var game_over_screen = load("res://scenes/GameOver.tscn").instantiate()
	get_node("UILayer").add_child(game_over_screen)
	
func change_track(track):
	current_track=track
	get_node("MusicPlayer").play_track("res://assets/music/"+current_track)
	
func _input(event: InputEvent) -> void:
	if is_playing:
		if event.is_action_pressed("escape"):
			is_paused = not is_paused
				
			get_tree().paused=is_paused
			pause_pressed.emit()
			
		if event.is_action_pressed("next"):
			track_id+=1
			track_id=track_id%len(tracks)
			change_track(tracks[track_id])
		if event.is_action_pressed("prev"):
			track_id-=1
			change_track(tracks[track_id])
			track_id=track_id%len(tracks)
