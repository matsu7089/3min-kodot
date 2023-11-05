extends Area2D
class_name Enemy

signal shoot(
    enemy_shot: EnemyShot,
    cell_pos: Vector2i,
    move_dir: int,
    move_per_frame: int,
)

const enemy_shot_scene := preload('res://scenes/EnemyShot/enemy_shot.tscn')

@onready var sprite_2d := $Sprite2D as Sprite2D

var cell_pos := Vector2i(0, 0):
    set(v):
        position = v * Global.CELL_SIZE
        cell_pos = v
    get:
        return cell_pos

var p_frame_cnt := 0
var move_dir := Global.Dir.RIGHT
var move_per_frame := 10
var shot_per_frame := 10
var shot_dir_list: Array[int] = []
var shot_move_per_frame := 10


func init(
    cell_pos: Vector2i,
    move_dir: int,
    move_per_frame: int,
    shot_dir_list: Array[int],
    shot_per_frame: int,
    shot_move_per_frame: int,
) -> void:
    self.cell_pos = cell_pos
    self.move_dir = move_dir
    self.move_per_frame = move_per_frame
    self.shot_dir_list = shot_dir_list
    self.shot_per_frame = shot_per_frame
    self.shot_move_per_frame = shot_move_per_frame
    

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

 
func _shot() -> void:
    for shot_dir in shot_dir_list:
        var enemy_shot := enemy_shot_scene.instantiate() as EnemyShot
        shoot.emit(enemy_shot, cell_pos, shot_dir, shot_move_per_frame)


func _sprite_frame_update() -> void:
    sprite_2d.frame = (sprite_2d.frame + 1) % 2


func _ready() -> void:
    pass


func _physics_process(_delta: float) -> void:
    p_frame_cnt += 1

    if p_frame_cnt % move_per_frame == 0:
        _move()
        _sprite_frame_update()
    elif p_frame_cnt % (move_per_frame / 2) == 0:
        _sprite_frame_update()
    
    if p_frame_cnt % shot_per_frame == 0:
        _shot()
        
