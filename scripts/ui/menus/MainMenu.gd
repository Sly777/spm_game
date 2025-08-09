extends Control

@onready var new_career_button = $VBoxContainer/NewCareerButton
@onready var load_career_button = $VBoxContainer/LoadCareerButton
@onready var settings_button = $VBoxContainer/SettingsButton
@onready var exit_button = $VBoxContainer/ExitButton

func _ready():
	# Connect button signals
	new_career_button.pressed.connect(_on_new_career_pressed)
	load_career_button.pressed.connect(_on_load_career_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	exit_button.pressed.connect(_on_exit_pressed)

func _on_new_career_pressed():
	print("Starting new career")
	# For now, just start with default values
	GameManager.start_new_career("New Manager", "Test Team")

	# TODO: Later we'll create a career setup scene
	# For now, let's create a simple team overview
	get_tree().change_scene_to_file("res://scenes/ui/dashboard/TeamOverview.tscn")

func _on_load_career_pressed():
	print("Load career not implemented yet")

func _on_settings_pressed():
	print("Settings not implemented yet")
	# TODO: Open settings menu when created

func _on_exit_pressed():
	print("Exiting game")
	get_tree().quit()
