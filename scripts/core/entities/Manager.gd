class_name Manager
extends BaseEntity

# Basic Information
var manager_name: String
var age: int
var nationality: String
var experience_years: int = 0

# RPG Progression
var level: int = 1
var experience_points: int = 0
var authority: int = 50  # How much players respect/fear you

# Management Skills
var leadership: int = 50
var tactical_knowledge: int = 50
var communication: int = 50
var psychology_understanding: int = 50

# Relationships with team
var team_relationships: Dictionary = {}

func _init(name: String = "New Manager"):
    super._init()
    manager_name = name
    age = randi_range(25, 60)
