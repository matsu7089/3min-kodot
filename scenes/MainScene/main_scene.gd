extends Node2D
class_name MainScene

signal game_finished(damage: int)

const warn_effect_scene := preload('res://scenes/WarnEffect/warn_effect.tscn')
const enemy_scene := preload('res://scenes/Enemy/enemy.tscn')

@onready var tile_map := $TileMap as TileMap
@onready var player := $Player as Player

var p_frame_cnt := 0
var task_list: Array[Stage.Task] = []
var next_task: Stage.Task = null


func _on_enemy_shoot(
    enemy_shot: EnemyShot,
    cell_pos: Vector2i,
    move_dir: int,
    move_per_frame: int
) -> void:
    add_child(enemy_shot)
    enemy_shot.init(cell_pos, move_dir, move_per_frame)
    

func _spawn(task: Stage.Task) -> void:
    var warn_effect := warn_effect_scene.instantiate() as WarnEffect
    add_child(warn_effect)

    warn_effect.init(task.cell_pos)
    
    await warn_effect.animation_finished
    
    var enemy := enemy_scene.instantiate() as Enemy
    add_child(enemy)

    enemy.init(
        task.cell_pos,
        task.move_dir,
        task.move_per_frame,
        task.shot_dir_list,
        task.shot_per_frame,
        task.shot_move_per_frame,
    )
    enemy.shoot.connect(_on_enemy_shoot)
    

func _ready() -> void:
    task_list = Stage.data.duplicate(true)
    
    # テスト用
    if Stage.start_frame != 0:
        p_frame_cnt = Stage.start_frame
        
        task_list = task_list.filter(
            func(v: Stage.Task): return v.frame > p_frame_cnt
        )

    next_task = task_list.pop_back()


func _process(_delta: float) -> void:
    pass


func _physics_process(_delta: float) -> void:
    p_frame_cnt += 1
    
    while next_task && next_task.frame == p_frame_cnt:
        _spawn(next_task)
        next_task = task_list.pop_back()
    
    if p_frame_cnt == 1800:
        game_finished.emit(player.hit_count)
