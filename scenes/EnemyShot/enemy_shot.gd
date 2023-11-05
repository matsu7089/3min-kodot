extends Area2D
class_name EnemyShot

@onready var sprite_2d := $Sprite2D as Sprite2D

var cell_pos := Vector2i(0, 0):
    set(v):
        position = v * Global.CELL_SIZE
        cell_pos = v
    get:
        return cell_pos

var p_frame_cnt := 0
var move_dir: int
var move_per_frame := 10


func init(
    cell_pos: Vector2i,
    move_dir: Global.Dir,
    move_per_frame: int
) -> void:
    self.cell_pos = cell_pos
    self.move_dir = move_dir
    self.move_per_frame = move_per_frame
    
    # 移動方向によってスプライトと角度を切り替え
    if move_dir & (move_dir - 1) == 0:
        sprite_2d.frame = 0
        if move_dir & (Global.Dir.LEFT | Global.Dir.RIGHT):
            sprite_2d.rotation = PI / 2
    else:
        sprite_2d.frame = 1
        if (
            move_dir == (Global.Dir.UP | Global.Dir.RIGHT)
            || move_dir == (Global.Dir.DOWN | Global.Dir.LEFT)
        ):
            sprite_2d.rotation = PI / 2

    # 敵と同じ位置なので1回動かす
    _move()


func _move() -> void:
    if move_dir & Global.Dir.UP:
        cell_pos.y -= 1
    if move_dir & Global.Dir.DOWN:
        cell_pos.y += 1
    if move_dir & Global.Dir.LEFT:
        cell_pos.x -= 1
    if move_dir & Global.Dir.RIGHT:
        cell_pos.x += 1
    
    if (
        cell_pos.x < 0
        || Global.CELL_W < cell_pos.x
        || cell_pos.y < 0
        || Global.CELL_H < cell_pos.y
    ):
        queue_free()


func _ready() -> void:
    pass


func _physics_process(_delta: float) -> void:
    p_frame_cnt += 1
    
    if p_frame_cnt % move_per_frame == 0:
        _move()
