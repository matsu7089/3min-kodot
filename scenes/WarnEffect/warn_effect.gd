extends Node2D
class_name WarnEffect

signal animation_finished

@onready var animated_sptite_2d := $AnimatedSprite2D as AnimatedSprite2D

var cell_pos := Vector2i(0, 0):
    set(v):
        position = v * Global.CELL_SIZE
        cell_pos = v
    get:
        return cell_pos

var _p_frame_cnt := 0
var _loop_cnt := 0


func init(cell_pos: Vector2i) -> void:
    self.cell_pos = cell_pos


func _ready() -> void:
    animated_sptite_2d.play('default')


func _physics_process(_delta: float) -> void:
    _p_frame_cnt += 1
    
    if _p_frame_cnt == 10:
        animation_finished.emit()
        queue_free()


func _on_animated_sprite_2d_animation_looped() -> void:
    animated_sptite_2d.hide()
