extends Control

# UI References
@onready var back_button = $HeaderContainer/BackButton
@onready var team_name_label = $HeaderContainer/TeamNameLabel
@onready var player_count_label = $MainContainer/TeamInfoPanel/StatsContainer/PlayerCountLabel
@onready var average_age_label = $MainContainer/TeamInfoPanel/StatsContainer/AverageAgeLabel
@onready var team_morale_label = $MainContainer/TeamInfoPanel/StatsContainer/TeamMoraleLabel
@onready var players_list_container = $MainContainer/PlayersPanel/ScrollContainer/PlayersList

func _ready():
	print("TeamOverview scene loaded") # Debug message

	# Connect back button
	back_button.pressed.connect(_on_back_button_pressed)

	if GameManager.current_team:
		setup_team_display()
	else:
		print("No team found in GameManager!")
		team_name_label.text = "No Team Loaded"

func _on_back_button_pressed():
	print("Returning to main menu")
	get_tree().change_scene_to_file("res://scenes/ui/menus/MainMenu.tscn")

func setup_team_display():
	var team = GameManager.current_team
	print("Setting up team display for: ", team.team_name) # Debug

	# Set team name
	team_name_label.text = "Team: " + team.team_name

	# Calculate and display team statistics
	update_team_statistics(team)

	# Clear and populate player list with enhanced display
	clear_players_list()
	populate_players_list(team)

func update_team_statistics(team: Team):
	var player_count = team.players.size()
	player_count_label.text = "Players: " + str(player_count)

	if player_count > 0:
		# Calculate average age
		var total_age = 0
		var mood_totals = {}

		for player in team.players:
			total_age += player.age

			# Count mood types for team morale
			var dominant_mood = get_dominant_mood(player)
			if dominant_mood in mood_totals:
				mood_totals[dominant_mood] += 1
			else:
				mood_totals[dominant_mood] = 1

		var average_age = round(float(total_age) / float(player_count))
		average_age_label.text = "Average Age: " + str(average_age)

		# Determine overall team morale
		var team_morale = determine_team_morale(mood_totals, player_count)
		team_morale_label.text = "Team Morale: " + team_morale
	else:
		average_age_label.text = "Average Age: N/A"
		team_morale_label.text = "Team Morale: N/A"

func determine_team_morale(mood_totals: Dictionary, total_players: int) -> String:
	if mood_totals.is_empty():
		return "Neutral"

	var dominant_mood = ""
	var highest_count = 0

	for mood in mood_totals:
		if mood_totals[mood] > highest_count:
			highest_count = mood_totals[mood]
			dominant_mood = mood

	# If more than 60% have the same mood, that's the team mood
	if float(highest_count) / float(total_players) > 0.6:
		return dominant_mood
	else:
		return "Mixed"

func clear_players_list():
	# Remove all child nodes from the players list container
	for child in players_list_container.get_children():
		child.queue_free()

func populate_players_list(team: Team):
	print("Adding ", team.players.size(), " players to list") # Debug

	for i in range(team.players.size()):
		var player = team.players[i]
		create_player_card(player, i + 1)

func create_player_card(player: Player, number: int):
	# Create a container for each player
	var player_container = HBoxContainer.new()
	player_container.add_theme_constant_override("separation", 10)

	# Player number
	var number_label = Label.new()
	number_label.text = str(number) + "."
	number_label.custom_minimum_size = Vector2(30, 0)
	player_container.add_child(number_label)

	# Player info container
	var info_container = VBoxContainer.new()
	info_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	# Player name (larger font)
	var name_label = Label.new()
	name_label.text = player.player_name
	name_label.add_theme_font_size_override("font_size", 16)
	info_container.add_child(name_label)

	# Player details (smaller font)
	var details_label = Label.new()
	details_label.text = "Age: %d | Mood: %s" % [player.age, get_dominant_mood(player)]
	details_label.add_theme_font_size_override("font_size", 12)
	details_label.modulate = Color(0.8, 0.8, 0.8) # Slightly dimmed
	info_container.add_child(details_label)

	player_container.add_child(info_container)

	# Add some spacing with a separator
	players_list_container.add_child(player_container)

	# Add a subtle separator line (except for the last player)
	if number < GameManager.current_team.players.size():
		var separator = HSeparator.new()
		separator.modulate = Color(0.3, 0.3, 0.3) # Dark separator
		players_list_container.add_child(separator)

func get_dominant_mood(player: Player) -> String:
	if player.current_moods.is_empty():
		return "Neutral"

	var strongest_mood = ""
	var strongest_value = 0

	for mood_type in player.current_moods:
		var value = abs(player.current_moods[mood_type])
		if value > strongest_value:
			strongest_value = value
			strongest_mood = mood_type

	return strongest_mood.capitalize()
