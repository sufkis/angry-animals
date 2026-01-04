extends Node2D

const ANIMAL = preload("uid://bgwwpcx6dn0ls")
const MAIN = preload("uid://ca3jpuhl3n83w")

@onready var animal_start: Marker2D = $AnimalStart

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_packed(MAIN)

func _ready() -> void:
	spawn_animal()

func _enter_tree() -> void:
	SignalHub.on_animal_died.connect(spawn_animal)

func spawn_animal() -> void:
	var new_animal = ANIMAL.instantiate()
	new_animal.position = animal_start.position
	add_child(new_animal)
