class_name Player
extends BaseEntity

# Basic Information
var player_name: String
var age: int = 18
var nationality: String
var position: String
var spoken_languages: Array[String]

# RPG Progression
var level: int = 1
var experience_points: int = 0
var skill_points: int = 0

# Personality & Psychology
var personality_type: PersonalityTypes.PersonalityType
var baseline_mood: int = 0
var current_moods: Dictionary = {}

# Enhanced Skills
var technical_skills: Dictionary = {
	"passing": 50,
	"shooting": 50,
	"dribbling": 50,
	"defending": 50,
	"goalkeeping": 20
}

var mental_attributes: Dictionary = {
	"leadership": 50,
	"cooperation": 50,
	"composure": 50,
	"determination": 50
}

# Relationships
var manager_relationship: int = 0
var teammate_relationships: Dictionary = {}

func _init(name: String = "New Player"):
	super._init()
	player_name = name
	initialize_default_values()

func initialize_default_values():
	age = randi_range(18, 35)
	baseline_mood = randi_range(-20, 20)

	# Assign random personality
	personality_type = PersonalityTypes.get_random_personality()

	# Apply personality influence to mental attributes
	var personality_data = PersonalityTypes.get_personality_data(personality_type)
	for trait_key in personality_data.base_traits:
		if mental_attributes.has(trait_key):
			mental_attributes[trait_key] += personality_data.base_traits[trait_key]
			# Keep within bounds
			mental_attributes[trait_key] = clamp(mental_attributes[trait_key], 0, 100)

	print("Created %s with %s personality" % [player_name, PersonalityTypes.get_personality_name(personality_type)])

func get_personality_description() -> String:
	var data = PersonalityTypes.get_personality_data(personality_type)
	return data.description

func get_personality_name() -> String:
	return PersonalityTypes.get_personality_name(personality_type)

func get_total_performance_modifier() -> float:
	var effects = MoodSystem.calculate_comprehensive_effects(self)
	return effects.get("performance", 0.0)
