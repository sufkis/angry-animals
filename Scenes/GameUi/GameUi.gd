extends Control

@onready var attempts_label: Label = $MarginContainer/VBoxContainer/AttemptsLabel
@onready var music: AudioStreamPlayer2D = $Music
@onready var vb_game_over: VBoxContainer = $MarginContainer/VBGameOver

var _attempts: int = -1

func _ready() -> void:
	on_attempt_made()

func _enter_tree() -> void:
	SignalHub.on_attempt_made.connect(on_attempt_made)
	SignalHub.on_cup_destroyed.connect(_on_cup_destroyed)

func on_attempt_made() -> void:
	_attempts += 1
	attempts_label.text = "Attempts %s" % _attempts

func _on_cup_destroyed(remaining_cups: int) -> void:
	if remaining_cups == 0:
		vb_game_over.show()
		music.play()
