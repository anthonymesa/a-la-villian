@tool

extends Node2D

var glyphs = [
	"atlas",
	"delilah",
	"julian",
	"mercer"
]

signal updated(type: int)

@export var type := 0:
	set(value):
		if value < 0:
			type = 0
		elif value >= glyphs.size():
			type = glyphs.size() - 1
		else:
			type = value
		
		updated.emit(type)
	get:
		return type
		

# Called when the node enters the scene tree for the first time.
func _ready():
	updated.connect(_on_updated_connect)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_updated_connect(type: int):
	$AnimatedSprite2D.animation = glyphs[type]
