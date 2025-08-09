class_name PersonalityTypes
extends RefCounted

# Personality type enum
enum PersonalityType {
	AGGRESSIVE,
	CALM,
	LEADER,
	ANXIOUS,
	BALANCED,
	VETERAN_MENTOR,
	HOT_HEAD,
	PERFECTIONIST,
	TEAM_CLOWN
}

# Standardized trait categories
enum TraitCategory {
	MOOD_MODIFIERS, # How personality affects mood changes
	BASE_TRAITS, # Core personality traits (leadership, cooperation, etc.)
	SPECIAL_TRAITS, # Unique personality-specific abilities
	EVENT_TRIGGERS, # Personality-based event probabilities
	TRAINING_EFFECTS, # How personality affects training outcomes
	TEAM_EFFECTS # How personality affects teammates
}

# Mood types enum
enum MoodType {
	ANGRY,
	CONFIDENT,
	FOCUSED,
	TIRED,
	MOTIVATED,
	DEPRESSED
}

# Base traits enum
enum BaseTrait {
	LEADERSHIP,
	COOPERATION,
	CARD_TENDENCY
}

# Special traits enum
enum SpecialTrait {
	MENTORSHIP_ABILITY,
	INJURY_RESISTANCE,
	EXPERIENCE_BONUS
}

# Event triggers enum
enum EventTrigger {
	ARGUMENT_CHANCE,
	RED_CARD_MULTIPLIER,
	SPECTACULAR_PLAY_BONUS
}

# Training effects enum
enum TrainingEffect {
	SKILL_GAIN_BONUS,
	BURNOUT_RISK
}

# Team effects enum
enum TeamEffect {
	MENTORSHIP_BONUS,
	TEAM_MORALE,
	MORALE_BOOST_OTHERS,
	CONCENTRATION_PENALTY
}

# Standardized data structure for all personalities
static var personality_data: Dictionary = {}

# Initialize personality data
static func _init():
	personality_data = {
		PersonalityType.AGGRESSIVE:
		{
			"name": "Aggressive",
			"description": "Hot-headed player who reacts strongly to conflicts",
			"mood_modifiers": {MoodType.ANGRY: 1.5, MoodType.CONFIDENT: 1.2, MoodType.FOCUSED: 0.8}, # Gets more angry  # More confident when winning  # Less focused under pressure
			"base_traits": {BaseTrait.LEADERSHIP: - 10, BaseTrait.COOPERATION: - 20, BaseTrait.CARD_TENDENCY: 30},
			"special_traits": {},
			"event_triggers": {EventTrigger.ARGUMENT_CHANCE: 0.25, EventTrigger.RED_CARD_MULTIPLIER: 2.0}, # 25% chance in conflicts
			"training_effects": {},
			"team_effects": {}
		},
		PersonalityType.CALM:
		{
			"name": "Calm",
			"description": "Steady player who keeps cool under pressure",
			"mood_modifiers": {MoodType.ANGRY: 0.3, MoodType.FOCUSED: 1.4, MoodType.CONFIDENT: 1.1}, # Rarely gets very angry  # Stays focused  # Stable confidence
			"base_traits": {BaseTrait.LEADERSHIP: 15, BaseTrait.COOPERATION: 20, BaseTrait.CARD_TENDENCY: - 15},
			"special_traits": {},
			"event_triggers": {},
			"training_effects": {},
			"team_effects": {}
		},
		PersonalityType.LEADER:
		{
			"name": "Leader",
			"description": "Natural captain who influences team morale",
			"mood_modifiers": {MoodType.CONFIDENT: 1.3, MoodType.ANGRY: 1.1, MoodType.FOCUSED: 1.2}, # More confident  # Gets frustrated with poor performance  # Stays focused for the team
			"base_traits": {BaseTrait.LEADERSHIP: 40, BaseTrait.COOPERATION: 10, BaseTrait.CARD_TENDENCY: 0},
			"special_traits": {},
			"event_triggers": {},
			"training_effects": {},
			"team_effects": {}
		},
		PersonalityType.ANXIOUS:
		{
			"name": "Anxious",
			"description": "Nervous player who struggles under pressure",
			"mood_modifiers": {MoodType.CONFIDENT: 0.7, MoodType.FOCUSED: 0.6, MoodType.ANGRY: 1.2}, # Less confident  # Loses focus easily  # Gets frustrated with mistakes
			"base_traits": {BaseTrait.LEADERSHIP: - 20, BaseTrait.COOPERATION: 5, BaseTrait.CARD_TENDENCY: 10},
			"special_traits": {},
			"event_triggers": {},
			"training_effects": {},
			"team_effects": {}
		},
		PersonalityType.BALANCED:
		{
			"name": "Balanced",
			"description": "Well-rounded player with no extreme tendencies",
			"mood_modifiers": {MoodType.ANGRY: 1.0, MoodType.CONFIDENT: 1.0, MoodType.FOCUSED: 1.0},
			"base_traits": {BaseTrait.LEADERSHIP: 0, BaseTrait.COOPERATION: 0, BaseTrait.CARD_TENDENCY: 0},
			"special_traits": {},
			"event_triggers": {},
			"training_effects": {},
			"team_effects": {}
		},
		PersonalityType.VETERAN_MENTOR:
		{
			"name": "Veteran Mentor",
			"description": "Experienced player who guides younger teammates",
			"mood_modifiers": {MoodType.CONFIDENT: 1.0, MoodType.ANGRY: 0.8, MoodType.FOCUSED: 1.3, MoodType.TIRED: 1.4}, # Less reactive with age  # Experience brings focus  # Gets tired faster
			"base_traits": {BaseTrait.LEADERSHIP: 25, BaseTrait.COOPERATION: 15, BaseTrait.CARD_TENDENCY: - 10},
			"special_traits": # More injury prone
			{SpecialTrait.MENTORSHIP_ABILITY: 40, SpecialTrait.INJURY_RESISTANCE: - 20, SpecialTrait.EXPERIENCE_BONUS: 30},
			"event_triggers": {},
			"training_effects": {},
			"team_effects": {TeamEffect.MENTORSHIP_BONUS: 20, TeamEffect.TEAM_MORALE: 15} # Boosts younger players
		},
		PersonalityType.HOT_HEAD:
		{
			"name": "Hot Head",
			"description": "Explosive personality, high risk/reward player",
			"mood_modifiers": {MoodType.ANGRY: 2.0, MoodType.CONFIDENT: 1.5, MoodType.DEPRESSED: 1.8}, # VERY reactive  # Sky high when good  # Crashes hard when bad
			"base_traits": {BaseTrait.LEADERSHIP: - 15, BaseTrait.COOPERATION: - 25, BaseTrait.CARD_TENDENCY: 50},
			"special_traits": {},
			"event_triggers": # 30% chance in conflicts
			{EventTrigger.ARGUMENT_CHANCE: 0.3, EventTrigger.RED_CARD_MULTIPLIER: 2.5, EventTrigger.SPECTACULAR_PLAY_BONUS: 1.4},
			"training_effects": {},
			"team_effects": {}
		},
		PersonalityType.PERFECTIONIST:
		{
			"name": "Perfectionist",
			"description": "Never satisfied, always pushing for more",
			"mood_modifiers": {MoodType.FOCUSED: 1.8, MoodType.DEPRESSED: 1.3, MoodType.CONFIDENT: 0.7}, # Hard on themselves  # Rarely truly confident
			"base_traits": {BaseTrait.LEADERSHIP: 10, BaseTrait.COOPERATION: 5, BaseTrait.CARD_TENDENCY: - 5},
			"special_traits": {},
			"event_triggers": {},
			"training_effects": {TrainingEffect.SKILL_GAIN_BONUS: 1.3, TrainingEffect.BURNOUT_RISK: 1.5},
			"team_effects": {}
		},
		PersonalityType.TEAM_CLOWN:
		{
			"name": "Team Clown",
			"description": "Keeps morale up but may lack seriousness",
			"mood_modifiers": {MoodType.MOTIVATED: 1.4, MoodType.FOCUSED: 0.8, MoodType.ANGRY: 0.6}, # Gets distracted  # Hard to anger
			"base_traits": {BaseTrait.LEADERSHIP: - 5, BaseTrait.COOPERATION: 15, BaseTrait.CARD_TENDENCY: - 5},
			"special_traits": {},
			"event_triggers": {},
			"training_effects": {},
			"team_effects": {TeamEffect.MORALE_BOOST_OTHERS: 15, TeamEffect.CONCENTRATION_PENALTY: - 10} # Boosts teammates
		}
	}

# Validation helper functions
static func get_all_mood_types() -> Array:
	return [MoodType.ANGRY, MoodType.CONFIDENT, MoodType.FOCUSED, MoodType.TIRED, MoodType.MOTIVATED, MoodType.DEPRESSED]

static func get_all_base_traits() -> Array:
	return [BaseTrait.LEADERSHIP, BaseTrait.COOPERATION, BaseTrait.CARD_TENDENCY]

static func get_all_special_traits() -> Array:
	return [SpecialTrait.MENTORSHIP_ABILITY, SpecialTrait.INJURY_RESISTANCE, SpecialTrait.EXPERIENCE_BONUS]

static func get_all_event_triggers() -> Array:
	return [EventTrigger.ARGUMENT_CHANCE, EventTrigger.RED_CARD_MULTIPLIER, EventTrigger.SPECTACULAR_PLAY_BONUS]

static func get_all_training_effects() -> Array:
	return [TrainingEffect.SKILL_GAIN_BONUS, TrainingEffect.BURNOUT_RISK]

static func get_all_team_effects() -> Array:
	return [TeamEffect.MENTORSHIP_BONUS, TeamEffect.TEAM_MORALE, TeamEffect.MORALE_BOOST_OTHERS, TeamEffect.CONCENTRATION_PENALTY]

# Get personality data by enum value
static func get_personality_data(personality_enum: PersonalityType) -> Dictionary:
	if personality_data.has(personality_enum):
		return personality_data[personality_enum]

	# Return balanced as fallback
	return personality_data[PersonalityType.BALANCED]

# Get personality data by string name (backward compatibility)
static func get_personality_data_by_name(personality_name: String) -> Dictionary:
	for enum_value in personality_data:
		if personality_data[enum_value].name == personality_name:
			return personality_data[enum_value]

	# Return balanced as fallback
	return personality_data[PersonalityType.BALANCED]

# Get random personality type
static func get_random_personality() -> PersonalityType:
	# Ensure data is initialized
	if not ensure_initialized():
		print("ERROR: Failed to initialize personality data, returning BALANCED as fallback")
		return PersonalityType.BALANCED

	var personality_list = personality_data.keys()
	return personality_list[randi() % personality_list.size()]

# Get personality name from enum
static func get_personality_name(personality_enum: PersonalityType) -> String:
	var data = get_personality_data(personality_enum)
	return data.name

# Get personality description from enum
static func get_personality_description(personality_enum: PersonalityType) -> String:
	var data = get_personality_data(personality_enum)
	return data.description

# Get specific trait category data
static func get_trait_category(
	personality_enum: PersonalityType, category: TraitCategory
) -> Dictionary:
	var data = get_personality_data(personality_enum)

	match category:
		TraitCategory.MOOD_MODIFIERS:
			return data.get("mood_modifiers", {})
		TraitCategory.BASE_TRAITS:
			return data.get("base_traits", {})
		TraitCategory.SPECIAL_TRAITS:
			return data.get("special_traits", {})
		TraitCategory.EVENT_TRIGGERS:
			return data.get("event_triggers", {})
		TraitCategory.TRAINING_EFFECTS:
			return data.get("training_effects", {})
		TraitCategory.TEAM_EFFECTS:
			return data.get("team_effects", {})
		_:
			return {}

# Validate personality data integrity
static func validate_personality_data() -> bool:
	for personality_enum in personality_data:
		var data = personality_data[personality_enum]

		# Check required fields
		if not data.has("name") or not data.has("description"):
			print("ERROR: Personality %s missing required fields" % personality_enum)
			return false

		# Validate mood modifiers
		for mood_type in data.get("mood_modifiers", {}):
			if mood_type not in get_all_mood_types():
				print(
					(
						"ERROR: Invalid mood type '%s' in personality %s"
						% [mood_type, personality_enum]
					)
				)
				return false

		# Validate base traits
		for trait_key in data.get("base_traits", {}):
			if trait_key not in get_all_base_traits():
				print(
					"ERROR: Invalid base trait '%s' in personality %s" % [trait_key, personality_enum]
				)
				return false

	print("Personality data validation passed!")
	return true

# Get all available personality types
static func get_all_personality_types() -> Array[PersonalityType]:
	if personality_data.is_empty():
		print("WARNING: personality_data is empty, returning empty array")
		return []

	return personality_data.keys()

# Get personality count
static func get_personality_count() -> int:
	return personality_data.size()

# Check if personality type exists
static func has_personality_type(personality_enum: PersonalityType) -> bool:
	return personality_data.has(personality_enum)

# Ensure personality data is initialized
static func ensure_initialized() -> bool:
	if personality_data.is_empty():
		print("WARNING: personality_data is empty, attempting to initialize...")
		# Force initialization by calling _init
		_init()
		return not personality_data.is_empty()
	return true
