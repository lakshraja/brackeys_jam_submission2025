extends Node

var time_between_cats=20
var next_time_to_spawn_cat=5

var time_between_biscuits=5
var next_time_to_spawn_biscuit=0

var time_between_smart_cats=45
var next_time_to_spawn_smart_cat=120




func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if get_parent().time>next_time_to_spawn_biscuit:
		spawn_biscuit()
		time_between_biscuits=time_between_biscuits*0.99
		next_time_to_spawn_biscuit+=time_between_biscuits
	
	if get_parent().time>next_time_to_spawn_cat:
		spawn_cat()
		time_between_cats=time_between_cats*1.1
		next_time_to_spawn_cat+=time_between_cats

	if get_parent().time>next_time_to_spawn_smart_cat:
		spawn_smart_cat()
		time_between_smart_cats=time_between_smart_cats*1.1
		next_time_to_spawn_smart_cat+=time_between_smart_cats


var rng1 = RandomNumberGenerator.new()
func spawn_biscuit()->void:
	var pos = Vector2.ZERO
	pos.x=rng1.randf_range(-1260, 3150)
	pos.y=rng1.randf_range(20, 2580)
	
	var biscuit_instance = load("res://scenes/Biscuit.tscn").instantiate()
	biscuit_instance.position=pos
	add_child(biscuit_instance)
	


var rng2 = RandomNumberGenerator.new()
func spawn_cat()->void:
	var pos = Vector2.ZERO
	pos.x=rng2.randf_range(-1260, 3150)
	pos.y=rng2.randf_range(20, 2580)
	
	var cat_instance = load("res://scenes/BouncingCat.tscn").instantiate()
	cat_instance.position=pos
	add_child(cat_instance)
	

var rng3 = RandomNumberGenerator.new()
func spawn_smart_cat()->void:
	var pos = Vector2.ZERO
	pos.x=rng3.randf_range(-1260, 3150)
	pos.y=rng3.randf_range(20, 2580)
	
	var cat_instance = load("res://scenes/Cat.tscn").instantiate()
	cat_instance.position=pos
	add_child(cat_instance)
	
