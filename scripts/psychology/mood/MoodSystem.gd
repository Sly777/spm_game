class_name MoodSystem
extends RefCounted

# Mood types and their effects
const MOOD_TYPES = {
    "angry": {"performance": -0.3, "cooperation": -0.4, "cards": 0.8},
    "confident": {"performance": 0.4, "leadership": 0.6, "risk_taking": 0.3},
    "focused": {"performance": 0.2, "decision_making": 0.3, "mistakes": -0.2},
    "tired": {"performance": -0.2, "speed": -0.3, "concentration": -0.2}
}

static func apply_mood_to_player(player: Player, mood_type: String, intensity: int):
    """Add or modify a mood for a player"""
    player.current_moods[mood_type] = intensity
    player.mark_modified()

static func calculate_mood_effects(player: Player) -> Dictionary:
    """Calculate combined effects of all current moods"""
    var total_effects = {}

    for mood_type in player.current_moods:
        var intensity = player.current_moods[mood_type]
        var mood_effects = MOOD_TYPES.get(mood_type, {})

        for effect_type in mood_effects:
            if not total_effects.has(effect_type):
                total_effects[effect_type] = 0.0

            # Apply intensity as percentage
            var effect_value = mood_effects[effect_type] * (abs(intensity) / 100.0)
            if intensity < 0:
                effect_value *= -1
            total_effects[effect_type] += effect_value

    return total_effects

static func decay_moods(player: Player, decay_rate: float = 0.1):
    """Gradually reduce mood intensities over time"""
    for mood_type in player.current_moods.keys():
        var current_value = player.current_moods[mood_type]
        var new_value = current_value * (1.0 - decay_rate)

        # Remove very weak moods
        if abs(new_value) < 5:
            player.current_moods.erase(mood_type)
        else:
            player.current_moods[mood_type] = int(new_value)

    player.mark_modified()
