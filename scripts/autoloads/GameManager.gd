extends Node

# Global game state
var current_team: Team
var current_manager: Manager
var game_time: Dictionary = {
	"day": 1,
	"week": 1,
	"month": 1,
	"season": 1
}

signal time_progressed(new_time)
signal player_mood_changed(player, mood_type, intensity)

func _ready():
	print("Soccer Psychology Manager - Game Manager Initialized")

func start_new_career(manager_name: String, team_name: String):
	"""Initialize a new manager career"""
	current_manager = Manager.new(manager_name)
	current_team = Team.new(team_name)
	current_team.manager = current_manager

	# Create some basic players for testing
	create_initial_squad()

	print("New career started: ", manager_name, " managing ", team_name)

func create_initial_squad():
	"""Create a basic squad of players for testing"""
	var player_names = ["John Smith", "Mike Johnson", "David Wilson", "Chris Brown"]

	for player_name in player_names:
		var player = Player.new(player_name)
		current_team.add_player(player)

	print("Created initial squad with ", current_team.get_player_count(), " players")

func progress_time(days: int = 1):
	"""Advance game time and trigger related systems"""
	game_time.day += days

	# Handle week/month progression
	if game_time.day > 7:
		game_time.week += 1
		game_time.day = 1

	if game_time.week > 4:
		game_time.month += 1
		game_time.week = 1

	time_progressed.emit(game_time)

	# Process mood decay for all players
	if current_team:
		for player in current_team.players:
			MoodSystem.decay_moods(player)
