extends Node3D

# Try our damnedest to make sure it has been loaded the fuck in.
@onready var waldo : MeshInstance3D = $Waldo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(Node.new()) # Trying to invalidate caching maybe? we don't know how to backpropgate a cause
	
	find_waldo()
	
	
	get_tree().create_timer(1).timeout.connect(find_waldo)
	print("-------")
	print("BELOW HERE IS AFTER 1s TIMEOUT")


func where_is_waldo(test_name: String, object_filter: String) -> void:
	print("Test Name: ", test_name)
	print("Waldo's current owner = ", waldo.owner)
	print("find_children(...):")
	print("owned=false: ", get_tree().root.find_children(object_filter, "", true, false))
	print("owned=true : ", get_tree().root.find_children(object_filter, "", true, true))
	
	print()
	print("find_child(...):")
	print("owned=false: ", get_tree().root.find_child(object_filter, true, false))
	print("owned=true : ", get_tree().root.find_child(object_filter, true, true))
	
	print()
	print()
	

func find_waldo() -> void:
	where_is_waldo("main.gd:_ready() ", "Waldo")
	where_is_waldo.call_deferred("main.gd:_ready().deferred() ", "Waldo")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
