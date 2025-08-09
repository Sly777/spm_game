class_name Team
extends BaseEntity

var team_name: String
var players: Array[Player] = []
var manager: Manager
var team_chemistry: float = 50.0
var morale: float = 50.0

func _init(name: String = "New Team"):
	super._init()
	team_name = name

func add_player(player: Player):
	players.append(player)

func get_player_count() -> int:
	return players.size()
