class_name BaseEntity
extends Resource

# Every game entity inherits from this base class
var entity_id: String
var created_at: float
var last_modified: float

func _init():
	entity_id = generate_unique_id()
	created_at = Time.get_unix_time_from_system()
	last_modified = created_at

func generate_unique_id() -> String:
	return str(Time.get_unix_time_from_system()) + "_" + str(randi())

func mark_modified():
	last_modified = Time.get_unix_time_from_system()
