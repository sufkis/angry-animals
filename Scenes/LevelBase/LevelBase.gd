extends Node2D

const ANIMAL = preload("uid://bgwwpcx6dn0ls")

@onready var animal_start: Marker2D = $AnimalStart

func _ready() -> void:
	spawn_animal()

func _enter_tree() -> void:
	SignalHub.on_animal_died.connect(spawn_animal)

func spawn_animal() -> void:
	var new_animal = ANIMAL.instantiate()
	new_animal.position = animal_start.position
	add_child(new_animal)
