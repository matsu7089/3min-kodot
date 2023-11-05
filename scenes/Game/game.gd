extends Node

@onready var main_scene := $MainScene as MainScene
@onready var label := $Label as Label


func _ready() -> void:
    label.hide()


func _process(_delta: float) -> void:
    pass


func _on_main_scene_game_finished(damage: int) -> void:
    label.text = 'GAME CLEAR!\ndamage: %d' % damage
    label.show()
