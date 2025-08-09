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
var personality_type: String
var baseline_mood: int = 0
var current_moods: Dictionary = {}  # {"angry": -60, "confident": 30}

# Basic Skills (we'll expand these later)
var technical_skills: Dictionary = {
    "passing": 50,
    "shooting": 50,
    "dribbling": 50
}

# Relationships
var manager_relationship: int = 0
var teammate_relationships: Dictionary = {}

func _init(name: String = "New Player"):
    super._init()
    player_name = name
    initialize_default_values()

func initialize_default_values():
    # Set random starting values
    age = randi_range(18, 35)
    baseline_mood = randi_range(-20, 20)
    personality_type = "Balanced"  # We'll add more types later
