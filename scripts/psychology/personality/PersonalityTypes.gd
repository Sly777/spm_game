class_name PersonalityTypes
extends RefCounted

# Personality type definitions with mood modifiers
const PERSONALITY_DATA = {
    "Aggressive": {
        "description": "Hot-headed player who reacts strongly to conflicts",
        "mood_modifiers": {
            "angry": 1.5,      # Gets more angry
            "confident": 1.2,   # More confident when winning
            "focused": 0.8      # Less focused under pressure
        },
        "base_traits": {
            "leadership": -10,
            "cooperation": -20,
            "card_tendency": 30
        }
    },

    "Calm": {
        "description": "Steady player who keeps cool under pressure",
        "mood_modifiers": {
            "angry": 0.3,       # Rarely gets very angry
            "focused": 1.4,     # Stays focused
            "confident": 1.1    # Stable confidence
        },
        "base_traits": {
            "leadership": 15,
            "cooperation": 20,
            "card_tendency": -15
        }
    },

    "Leader": {
        "description": "Natural captain who influences team morale",
        "mood_modifiers": {
            "confident": 1.3,   # More confident
            "angry": 1.1,       # Gets frustrated with poor performance
            "focused": 1.2      # Stays focused for the team
        },
        "base_traits": {
            "leadership": 40,
            "cooperation": 10,
            "card_tendency": 0
        }
    },

    "Anxious": {
        "description": "Nervous player who struggles under pressure",
        "mood_modifiers": {
            "confident": 0.7,   # Less confident
            "focused": 0.6,     # Loses focus easily
            "angry": 1.2        # Gets frustrated with mistakes
        },
        "base_traits": {
            "leadership": -20,
            "cooperation": 5,
            "card_tendency": 10
        }
    },

    "Balanced": {
        "description": "Well-rounded player with no extreme tendencies",
        "mood_modifiers": {
            "angry": 1.0,
            "confident": 1.0,
            "focused": 1.0
        },
        "base_traits": {
            "leadership": 0,
            "cooperation": 0,
            "card_tendency": 0
        }
    }
}

static func get_personality_types() -> Array:
    return PERSONALITY_DATA.keys()

static func get_personality_data(personality_type: String) -> Dictionary:
    return PERSONALITY_DATA.get(personality_type, PERSONALITY_DATA["Balanced"])

static func get_random_personality() -> String:
    var types = get_personality_types()
    return types[randi() % types.size()]
