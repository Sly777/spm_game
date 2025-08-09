class_name MoodSystem
extends RefCounted

# Mood types and their effects
const MOOD_TYPES = {
	"angry": {
		"performance": -0.3,
		"cooperation": -0.4,
		"cards": 0.8,
		"leadership": -0.2
	},
	"confident": {
		"performance": 0.4,
		"leadership": 0.6,
		"risk_taking": 0.3,
		"cooperation": 0.1
	},
	"focused": {
		"performance": 0.2,
		"decision_making": 0.3,
		"mistakes": -0.2,
		"cards": -0.1
	},
	"tired": {
		"performance": -0.2,
		"speed": -0.3,
		"concentration": -0.2,
		"mistakes": 0.15
	},
	"motivated": {
		"performance": 0.25,
		"cooperation": 0.3,
		"leadership": 0.2
	},
	"depressed": {
		"performance": -0.4,
		"cooperation": -0.2,
		"leadership": -0.3,
		"risk_taking": -0.2
	}
}

static func apply_mood_to_player(player: Player, mood_type: String, intensity: int):
	"""Add mood with personality influence"""
	var personality_data = PersonalityTypes.get_personality_data(player.personality_type)
	var modifier = personality_data.mood_modifiers.get(mood_type, 1.0)

	# Apply personality modifier to intensity
	var final_intensity = int(intensity * modifier)

	player.current_moods[mood_type] = final_intensity
	player.mark_modified()

	print("Applied mood '%s' (%d -> %d) to %s (%s personality)" % [
		mood_type, intensity, final_intensity,
		player.player_name, PersonalityTypes.get_personality_name(player.personality_type)
	])

static func calculate_comprehensive_effects(player: Player) -> Dictionary:
	"""Calculate effects including personality traits"""
	var mood_effects = calculate_mood_effects(player)
	var personality_data = PersonalityTypes.get_personality_data(player.personality_type)
	var base_traits = personality_data.base_traits

	# Combine mood effects with personality base traits
	var total_effects = mood_effects.duplicate()
	for trait_key in base_traits:
		var base_value = base_traits[trait_key] / 100.0  # Convert to decimal
		total_effects[trait_key] = total_effects.get(trait_key, 0.0) + base_value

	return total_effects

static func calculate_mood_effects(player: Player) -> Dictionary:
	"""Calculate combined effects of all current moods"""
	var total_effects = {}

	for mood_type in player.current_moods:
		var intensity = player.current_moods[mood_type]
		var mood_effects = MOOD_TYPES.get(mood_type, {})

		for effect_type in mood_effects:
			if not total_effects.has(effect_type):
				total_effects[effect_type] = 0.0

			var effect_value = mood_effects[effect_type] * (abs(intensity) / 100.0)
			if intensity < 0:
				effect_value *= -1
			total_effects[effect_type] += effect_value

	return total_effects

static func trigger_mood_event(player: Player, event_type: String):
	"""Trigger specific mood changes based on events"""
	print("[MoodSystem] Triggering mood event: %s for player: %s" % [event_type, player.player_name])
	print("[MoodSystem] Player current moods before event: %s" % player.current_moods)

	match event_type:
		"scored_goal":
			print("[MoodSystem] Player scored a goal - applying confident (+40) and motivated (+30)")
			apply_mood_to_player(player, "confident", 40)
			apply_mood_to_player(player, "motivated", 30)
		"missed_penalty":
			print("[MoodSystem] Player missed penalty - applying depressed (-50) and angry (-30)")
			apply_mood_to_player(player, "depressed", -50)
			apply_mood_to_player(player, "angry", -30)
		"got_red_card":
			print("[MoodSystem] Player got red card - applying angry (-70) and depressed (-20)")
			apply_mood_to_player(player, "angry", -70)
			apply_mood_to_player(player, "depressed", -20)
		"praised_by_manager":
			print("[MoodSystem] Player praised by manager - applying confident (+25) and motivated (+35)")
			apply_mood_to_player(player, "confident", 25)
			apply_mood_to_player(player, "motivated", 35)
		_:
			print("[MoodSystem] Unknown event type: %s - no mood changes applied" % event_type)
			return

	print("[MoodSystem] Player moods after event: %s" % player.current_moods)
	print("[MoodSystem] Mood event '%s' completed for player: %s" % [event_type, player.player_name])

static func decay_moods(player: Player, decay_rate: float = 0.1):
	"""Gradually reduce mood intensities over time"""
	for mood_type in player.current_moods.keys():
		var current_value = player.current_moods[mood_type]
		var new_value = current_value * (1.0 - decay_rate)

		if abs(new_value) < 5:
			player.current_moods.erase(mood_type)
		else:
			player.current_moods[mood_type] = int(new_value)

	player.mark_modified()
