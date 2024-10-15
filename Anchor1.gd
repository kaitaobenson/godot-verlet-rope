extends Sprite2D

@onready var rope: Rope = $"../Rope"

func _ready() -> void:
	rope.start_anchor = true

func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	rope.start_anchor_pos = global_position
