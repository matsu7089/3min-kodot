extends Node

class Task:
    # 敵出現フレーム
    var frame: int 
    # 敵情報
    var cell_pos: Vector2i
    var move_dir: int
    var move_per_frame: int
    # 攻撃情報
    var shot_dir_list: Array[int]
    var shot_per_frame: int
    var shot_move_per_frame: int

    func _init(
        frame: int,
        cell_pos: Vector2i,
        move_dir: int,
        move_per_frame: int,
        shot_dir_list: Array[int] = [],
        shot_per_frame: int = 1,
        shot_move_per_frame: int = 1,
    ) -> void:
        self.frame = frame 
        self.cell_pos = cell_pos
        self.move_dir = move_dir
        self.move_per_frame = move_per_frame
        self.shot_dir_list = shot_dir_list
        self.shot_per_frame = shot_per_frame
        self.shot_move_per_frame = shot_move_per_frame


const U := Global.Dir.UP
const D := Global.Dir.DOWN
const L := Global.Dir.LEFT
const R := Global.Dir.RIGHT

var data: Array[Task] = [
    Task.new(10, Vector2i(0, 0), D, 20),
    Task.new(10, Vector2i(2, 0), D, 20),
    Task.new(10, Vector2i(4, 0), D, 20),
    Task.new(10, Vector2i(6, 0), D, 20),
    
    Task.new(70, Vector2i(1, 0), D, 20),
    Task.new(70, Vector2i(3, 0), D, 20),
    Task.new(70, Vector2i(5, 0), D, 20),
    Task.new(70, Vector2i(7, 0), D, 20),
    
    Task.new(150, Vector2i(0, 0), D, 20),
    Task.new(150, Vector2i(1, 0), D, 20),
    Task.new(150, Vector2i(2, 0), D, 20),
    Task.new(150, Vector2i(3, 0), D, 20),
    Task.new(150, Vector2i(4, 0), D, 20),
    Task.new(150, Vector2i(5, 0), D, 20),
    Task.new(150, Vector2i(6, 0), D, 20),
    
    Task.new(230, Vector2i(1, 0), D, 20),
    Task.new(230, Vector2i(2, 0), D, 20),
    Task.new(230, Vector2i(3, 0), D, 20),
    Task.new(230, Vector2i(4, 0), D, 20),
    Task.new(230, Vector2i(5, 0), D, 20),
    Task.new(230, Vector2i(6, 0), D, 20),
    Task.new(230, Vector2i(7, 0), D, 20),
    
    Task.new(290, Vector2i(7, 0), L, 20),
    Task.new(290, Vector2i(7, 1), L, 20),
    Task.new(290, Vector2i(7, 2), L, 20),
    Task.new(290, Vector2i(7, 3), L, 20),
    Task.new(290, Vector2i(7, 4), L, 20),
    Task.new(290, Vector2i(7, 5), L, 20),
    Task.new(290, Vector2i(7, 6), L, 20),
    
    Task.new(360, Vector2i(0, 0), D, 10),
    Task.new(370, Vector2i(1, 0), D, 10),
    Task.new(380, Vector2i(2, 0), D, 10),
    
    Task.new(400, Vector2i(6, 0), U, 10),
    Task.new(400, Vector2i(5, 1), L, 10),
    Task.new(400, Vector2i(7, 1), R, 10),
    Task.new(400, Vector2i(6, 2), D, 10),
    Task.new(400, Vector2i(6, 0), U, 10),
    Task.new(400, Vector2i(5, 1), L, 10),
    Task.new(400, Vector2i(7, 1), R, 10),
    Task.new(400, Vector2i(6, 2), D, 10),
    
    Task.new(440, Vector2i(1, 5), U, 10),
    Task.new(440, Vector2i(0, 6), L, 10),
    Task.new(440, Vector2i(2, 6), R, 10),
    Task.new(440, Vector2i(1, 7), D, 10),
    
    Task.new(480, Vector2i(3, 3), U, 10),
    Task.new(480, Vector2i(4, 3), R, 10),
    Task.new(480, Vector2i(3, 4), L, 10),
    Task.new(480, Vector2i(4, 4), D, 10),
    
    Task.new(520, Vector2i(1, 0), R, 10),
    Task.new(520, Vector2i(1, 1), R, 10),
    Task.new(520, Vector2i(0, 1), D, 10),
    Task.new(520, Vector2i(1, 1), D, 10),
    Task.new(520, Vector2i(6, 6), L, 10),
    Task.new(520, Vector2i(6, 7), L, 10),
    Task.new(520, Vector2i(6, 6), U, 10),
    Task.new(520, Vector2i(7, 6), U, 10),
    
    Task.new(600, Vector2i(0, 7), L, 1),
    Task.new(600, Vector2i(1, 7), L, 1),
    Task.new(600, Vector2i(2, 7), L, 1),
    Task.new(600, Vector2i(3, 7), L, 1),
    Task.new(600, Vector2i(4, 7), R, 1),
    Task.new(600, Vector2i(5, 7), R, 1),
    Task.new(600, Vector2i(6, 7), R, 1),
    Task.new(600, Vector2i(7, 7), R, 1),
    
    Task.new(600, Vector2i(0, 7), L, 1),
    Task.new(600, Vector2i(1, 7), L, 1),
    Task.new(600, Vector2i(2, 7), L, 1),
    Task.new(600, Vector2i(3, 7), L, 1),
    Task.new(600, Vector2i(4, 7), R, 1),
    Task.new(600, Vector2i(5, 7), R, 1),
    Task.new(600, Vector2i(6, 7), R, 1),
    Task.new(600, Vector2i(7, 7), R, 1),

    Task.new(610, Vector2i(0, 6), L, 1),
    Task.new(610, Vector2i(1, 6), L, 1),
    Task.new(610, Vector2i(2, 6), L, 1),
    Task.new(610, Vector2i(3, 6), L, 1),
    Task.new(610, Vector2i(4, 6), R, 1),
    Task.new(610, Vector2i(5, 6), R, 1),
    Task.new(610, Vector2i(6, 6), R, 1),
    Task.new(610, Vector2i(7, 6), R, 1),

    Task.new(620, Vector2i(0, 5), L, 1),
    Task.new(620, Vector2i(1, 5), L, 1),
    Task.new(620, Vector2i(2, 5), L, 1),
    Task.new(620, Vector2i(3, 5), L, 1),
    Task.new(620, Vector2i(4, 5), R, 1),
    Task.new(620, Vector2i(5, 5), R, 1),
    Task.new(620, Vector2i(6, 5), R, 1),
    Task.new(620, Vector2i(7, 5), R, 1),

    Task.new(630, Vector2i(0, 4), L, 1),
    Task.new(630, Vector2i(1, 4), L, 1),
    Task.new(630, Vector2i(2, 4), L, 1),
    Task.new(630, Vector2i(3, 4), L, 1),
    Task.new(630, Vector2i(4, 4), R, 1),
    Task.new(630, Vector2i(5, 4), R, 1),
    Task.new(630, Vector2i(6, 4), R, 1),
    Task.new(630, Vector2i(7, 4), R, 1),

    Task.new(640, Vector2i(0, 3), L, 1),
    Task.new(640, Vector2i(1, 3), L, 1),
    Task.new(640, Vector2i(2, 3), L, 1),
    Task.new(640, Vector2i(3, 3), L, 1),
    Task.new(640, Vector2i(4, 3), R, 1),
    Task.new(640, Vector2i(5, 3), R, 1),
    Task.new(640, Vector2i(6, 3), R, 1),
    Task.new(640, Vector2i(7, 3), R, 1),
    
    Task.new(650, Vector2i(0, 2), L, 1),
    Task.new(650, Vector2i(1, 2), L, 1),
    Task.new(650, Vector2i(2, 2), L, 1),
    Task.new(650, Vector2i(3, 2), L, 1),
    Task.new(650, Vector2i(4, 2), R, 1),
    Task.new(650, Vector2i(5, 2), R, 1),
    Task.new(650, Vector2i(6, 2), R, 1),
    Task.new(650, Vector2i(7, 2), R, 1),

    Task.new(660, Vector2i(0, 1), L, 1),
    Task.new(660, Vector2i(1, 1), L, 1),
    Task.new(660, Vector2i(2, 1), L, 1),
    Task.new(660, Vector2i(3, 1), L, 1),
    Task.new(660, Vector2i(4, 1), R, 1),
    Task.new(660, Vector2i(5, 1), R, 1),
    Task.new(660, Vector2i(6, 1), R, 1),
    Task.new(660, Vector2i(7, 1), R, 1),

    Task.new(670, Vector2i(0, 0), L, 1),
    Task.new(670, Vector2i(1, 0), L, 1),
    Task.new(670, Vector2i(2, 0), L, 1),
    Task.new(670, Vector2i(3, 0), L, 1),
    Task.new(670, Vector2i(4, 0), R, 1),
    Task.new(670, Vector2i(5, 0), R, 1),
    Task.new(670, Vector2i(6, 0), R, 1),
    Task.new(670, Vector2i(7, 0), R, 1),
    
    Task.new(680, Vector2i(0, 0), U, 1),
    Task.new(680, Vector2i(0, 1), U, 1),
    Task.new(680, Vector2i(0, 2), U, 1),
    Task.new(680, Vector2i(0, 3), U, 1),
    Task.new(680, Vector2i(0, 4), U, 1),
    Task.new(680, Vector2i(0, 5), U, 1),
    Task.new(680, Vector2i(0, 6), U, 1),
    Task.new(680, Vector2i(0, 7), U, 1),
    Task.new(680, Vector2i(2, 0), D, 1),
    Task.new(680, Vector2i(2, 1), D, 1),
    Task.new(680, Vector2i(2, 2), D, 1),
    Task.new(680, Vector2i(2, 3), D, 1),
    Task.new(680, Vector2i(2, 4), D, 1),
    Task.new(680, Vector2i(2, 5), D, 1),
    Task.new(680, Vector2i(2, 6), D, 1),
    Task.new(680, Vector2i(2, 7), D, 1),
    Task.new(680, Vector2i(4, 0), U, 1),
    Task.new(680, Vector2i(4, 1), U, 1),
    Task.new(680, Vector2i(4, 2), U, 1),
    Task.new(680, Vector2i(4, 3), U, 1),
    Task.new(680, Vector2i(4, 4), U, 1),
    Task.new(680, Vector2i(4, 5), U, 1),
    Task.new(680, Vector2i(4, 6), U, 1),
    Task.new(680, Vector2i(4, 7), U, 1),
    Task.new(680, Vector2i(6, 0), D, 1),
    Task.new(680, Vector2i(6, 1), D, 1),
    Task.new(680, Vector2i(6, 2), D, 1),
    Task.new(680, Vector2i(6, 3), D, 1),
    Task.new(680, Vector2i(6, 4), D, 1),
    Task.new(680, Vector2i(6, 5), D, 1),
    Task.new(680, Vector2i(6, 6), D, 1),
    Task.new(680, Vector2i(6, 7), D, 1),

    Task.new(690, Vector2i(1, 0), U, 1),
    Task.new(690, Vector2i(1, 1), U, 1),
    Task.new(690, Vector2i(1, 2), U, 1),
    Task.new(690, Vector2i(1, 3), U, 1),
    Task.new(690, Vector2i(1, 4), U, 1),
    Task.new(690, Vector2i(1, 5), U, 1),
    Task.new(690, Vector2i(1, 6), U, 1),
    Task.new(690, Vector2i(1, 7), U, 1),
    Task.new(690, Vector2i(3, 0), D, 1),
    Task.new(690, Vector2i(3, 1), D, 1),
    Task.new(690, Vector2i(3, 2), D, 1),
    Task.new(690, Vector2i(3, 3), D, 1),
    Task.new(690, Vector2i(3, 4), D, 1),
    Task.new(690, Vector2i(3, 5), D, 1),
    Task.new(690, Vector2i(3, 6), D, 1),
    Task.new(690, Vector2i(3, 7), D, 1),
    Task.new(690, Vector2i(5, 0), U, 1),
    Task.new(690, Vector2i(5, 1), U, 1),
    Task.new(690, Vector2i(5, 2), U, 1),
    Task.new(690, Vector2i(5, 3), U, 1),
    Task.new(690, Vector2i(5, 4), U, 1),
    Task.new(690, Vector2i(5, 5), U, 1),
    Task.new(690, Vector2i(5, 6), U, 1),
    Task.new(690, Vector2i(5, 7), U, 1),
    Task.new(690, Vector2i(7, 0), D, 1),
    Task.new(690, Vector2i(7, 1), D, 1),
    Task.new(690, Vector2i(7, 2), D, 1),
    Task.new(690, Vector2i(7, 3), D, 1),
    Task.new(690, Vector2i(7, 4), D, 1),
    Task.new(690, Vector2i(7, 5), D, 1),
    Task.new(690, Vector2i(7, 6), D, 1),
    Task.new(690, Vector2i(7, 7), D, 1),
    
    Task.new(700, Vector2i(0, 0), R, 30, [D], 15, 5),
    Task.new(730, Vector2i(0, 1), R, 30, [D], 15, 1),
    Task.new(760, Vector2i(0, 0), R, 30, [D], 15, 5),
    Task.new(790, Vector2i(0, 1), R, 30, [D], 15, 1),
    Task.new(820, Vector2i(0, 0), R, 30, [D], 15, 5),

    Task.new(1000, Vector2i(7, 0), L, 100, [L,R], 10, 5),
    Task.new(1100, Vector2i(7, 1), L, 100, [L,R], 10, 5),
    Task.new(1000, Vector2i(7, 7), L, 100, [L,R], 10, 5),
    Task.new(1100, Vector2i(7, 6), L, 100, [L,R], 10, 5),
    
    Task.new(1200, Vector2i(7, 3), L, 1),
    Task.new(1210, Vector2i(7, 5), L, 1),
    Task.new(1220, Vector2i(7, 2), L, 1),
    Task.new(1230, Vector2i(7, 5), L, 1),
    Task.new(1240, Vector2i(7, 4), L, 1),
    Task.new(1250, Vector2i(7, 2), L, 1),

    Task.new(1260, Vector2i(0, 3), L, 1),
    Task.new(1260, Vector2i(1, 3), L, 1),
    Task.new(1260, Vector2i(2, 3), L, 1),
    Task.new(1260, Vector2i(3, 3), L, 1),
    Task.new(1260, Vector2i(4, 3), R, 1),
    Task.new(1260, Vector2i(5, 3), R, 1),
    Task.new(1260, Vector2i(6, 3), R, 1),
    Task.new(1260, Vector2i(7, 3), R, 1),

    Task.new(1270, Vector2i(0, 5), L, 1),
    Task.new(1270, Vector2i(1, 5), L, 1),
    Task.new(1270, Vector2i(2, 5), L, 1),
    Task.new(1270, Vector2i(3, 5), L, 1),
    Task.new(1270, Vector2i(4, 5), R, 1),
    Task.new(1270, Vector2i(5, 5), R, 1),
    Task.new(1270, Vector2i(6, 5), R, 1),
    Task.new(1270, Vector2i(7, 5), R, 1),

    Task.new(1280, Vector2i(0, 4), L, 1),
    Task.new(1280, Vector2i(1, 4), L, 1),
    Task.new(1280, Vector2i(2, 4), L, 1),
    Task.new(1280, Vector2i(3, 4), L, 1),
    Task.new(1280, Vector2i(4, 4), R, 1),
    Task.new(1280, Vector2i(5, 4), R, 1),
    Task.new(1280, Vector2i(6, 4), R, 1),
    Task.new(1280, Vector2i(7, 4), R, 1),
    Task.new(1280, Vector2i(0, 4), L, 1),
    
    Task.new(1290, Vector2i(0, 3), L, 1),
    Task.new(1290, Vector2i(1, 3), L, 1),
    Task.new(1290, Vector2i(2, 3), L, 1),
    Task.new(1290, Vector2i(3, 3), L, 1),
    Task.new(1290, Vector2i(4, 3), R, 1),
    Task.new(1290, Vector2i(5, 3), R, 1),
    Task.new(1290, Vector2i(6, 3), R, 1),
    Task.new(1290, Vector2i(7, 3), R, 1),

    Task.new(1300, Vector2i(0, 2), L, 1),
    Task.new(1300, Vector2i(1, 2), L, 1),
    Task.new(1300, Vector2i(2, 2), L, 1),
    Task.new(1300, Vector2i(3, 2), L, 1),
    Task.new(1300, Vector2i(4, 2), R, 1),
    Task.new(1300, Vector2i(5, 2), R, 1),
    Task.new(1300, Vector2i(6, 2), R, 1),
    Task.new(1300, Vector2i(7, 2), R, 1),
    
    Task.new(1310, Vector2i(0, 0), D, 1, [R], 2, 5),
    Task.new(1320, Vector2i(0, 7), U, 1, [R], 2, 5),
    Task.new(1330, Vector2i(0, 0), D, 1, [R], 2, 5),
    Task.new(1340, Vector2i(0, 7), U, 1, [R], 2, 5),
    Task.new(1350, Vector2i(0, 0), D, 1, [R], 2, 5),
    
    Task.new(1400, Vector2i(0, 0), R, 1, [D], 2, 5),
    Task.new(1400, Vector2i(0, 0), D, 10, [U, D], 10, 5),
    Task.new(1400, Vector2i(7, 0), D, 10, [U, D], 10, 5),
    Task.new(1410, Vector2i(7, 0), L, 1, [D], 2, 5),
    Task.new(1420, Vector2i(0, 0), R, 1, [D], 2, 5),
    
    Task.new(1500, Vector2i(0, 7), R, 2, [U|L, U|R], 4, 4),
    Task.new(1500, Vector2i(7, 0), L, 2, [D|L, D|R], 4, 4),
    
    Task.new(1550, Vector2i(0, 3), L, 1),
    Task.new(1550, Vector2i(1, 3), L, 1),
    Task.new(1550, Vector2i(2, 3), L, 1),
    Task.new(1550, Vector2i(3, 3), L, 1),
    Task.new(1550, Vector2i(4, 3), R, 1),
    Task.new(1550, Vector2i(5, 3), R, 1),
    Task.new(1550, Vector2i(6, 3), R, 1),
    Task.new(1550, Vector2i(7, 3), R, 1),
    Task.new(1550, Vector2i(0, 5), L, 1),
    Task.new(1550, Vector2i(1, 5), L, 1),
    Task.new(1550, Vector2i(2, 5), L, 1),
    Task.new(1550, Vector2i(3, 5), L, 1),
    Task.new(1550, Vector2i(4, 5), R, 1),
    Task.new(1550, Vector2i(5, 5), R, 1),
    Task.new(1550, Vector2i(6, 5), R, 1),
    Task.new(1550, Vector2i(7, 5), R, 1),

    Task.new(1560, Vector2i(0, 2), L, 1),
    Task.new(1560, Vector2i(1, 2), L, 1),
    Task.new(1560, Vector2i(2, 2), L, 1),
    Task.new(1560, Vector2i(3, 2), L, 1),
    Task.new(1560, Vector2i(4, 2), R, 1),
    Task.new(1560, Vector2i(5, 2), R, 1),
    Task.new(1560, Vector2i(6, 2), R, 1),
    Task.new(1560, Vector2i(7, 2), R, 1),
    Task.new(1560, Vector2i(0, 4), L, 1),
    Task.new(1560, Vector2i(1, 4), L, 1),
    Task.new(1560, Vector2i(2, 4), L, 1),
    Task.new(1560, Vector2i(3, 4), L, 1),
    Task.new(1560, Vector2i(4, 4), R, 1),
    Task.new(1560, Vector2i(5, 4), R, 1),
    Task.new(1560, Vector2i(6, 4), R, 1),
    Task.new(1560, Vector2i(7, 4), R, 1),
    
    
    Task.new(1000, Vector2i(7, 0), L, 100, [L,R], 10, 5),
    Task.new(1100, Vector2i(7, 1), L, 100, [L,R], 10, 5),
    Task.new(1000, Vector2i(7, 7), L, 100, [L,R], 10, 5),
    Task.new(1100, Vector2i(7, 6), L, 100, [L,R], 10, 5),
    
    Task.new(1600, Vector2i(0, 2), R, 20, [L,R], 10, 5),
    Task.new(1620, Vector2i(0, 3), R, 20, [L,R], 10, 5),
#    Task.new(1600, Vector2i(0, 4), R, 50, [L,R], 10, 5),
    Task.new(1620, Vector2i(0, 5), R, 20, [L,R], 10, 5),
    
    Task.new(1650, Vector2i(0, 4), U, 1),
    Task.new(1650, Vector2i(1, 4), U, 1),
    Task.new(1650, Vector2i(2, 4), U, 1),
    Task.new(1650, Vector2i(3, 4), U, 1),
#    Task.new(1650, Vector2i(4, 4), U, 1),
    Task.new(1650, Vector2i(5, 4), U, 1),
    Task.new(1650, Vector2i(6, 4), U, 1),
    Task.new(1650, Vector2i(7, 4), U, 1),
    
    Task.new(1670, Vector2i(0, 4), U, 1),
#    Task.new(1670, Vector2i(1, 4), U, 1),
    Task.new(1670, Vector2i(2, 4), U, 1),
    Task.new(1670, Vector2i(3, 4), U, 1),
    Task.new(1670, Vector2i(4, 4), U, 1),
    Task.new(1670, Vector2i(5, 4), U, 1),
    Task.new(1670, Vector2i(6, 4), U, 1),
    Task.new(1670, Vector2i(7, 4), U, 1),

    Task.new(1690, Vector2i(0, 4), U, 1),
    Task.new(1690, Vector2i(1, 4), U, 1),
    Task.new(1690, Vector2i(2, 4), U, 1),
    Task.new(1690, Vector2i(3, 4), U, 1),
    Task.new(1690, Vector2i(4, 4), U, 1),
    Task.new(1690, Vector2i(5, 4), U, 1),
    Task.new(1690, Vector2i(6, 4), U, 1),
#    Task.new(1690, Vector2i(7, 4), U, 1),

#    Task.new(1710, Vector2i(0, 4), U, 1),
    Task.new(1710, Vector2i(1, 4), U, 1),
    Task.new(1710, Vector2i(2, 4), U, 1),
    Task.new(1710, Vector2i(3, 4), U, 1),
    Task.new(1710, Vector2i(4, 4), U, 1),
    Task.new(1710, Vector2i(5, 4), U, 1),
    Task.new(1710, Vector2i(6, 4), U, 1),
    Task.new(1710, Vector2i(7, 4), U, 1),

    Task.new(1730, Vector2i(0, 4), U, 1),
    Task.new(1730, Vector2i(1, 4), U, 1),
    Task.new(1730, Vector2i(2, 4), U, 1),
    Task.new(1730, Vector2i(3, 4), U, 1),
    Task.new(1730, Vector2i(4, 4), U, 1),
#    Task.new(1730, Vector2i(5, 4), U, 1),
    Task.new(1730, Vector2i(6, 4), U, 1),
    Task.new(1730, Vector2i(7, 4), U, 1),

#    Task.new(1750, Vector2i(0, 4), U, 1),
    Task.new(1750, Vector2i(1, 4), U, 1),
    Task.new(1750, Vector2i(2, 4), U, 1),
    Task.new(1750, Vector2i(3, 4), U, 1),
    Task.new(1750, Vector2i(4, 4), U, 1),
    Task.new(1750, Vector2i(5, 4), U, 1),
    Task.new(1750, Vector2i(6, 4), U, 1),
    Task.new(1750, Vector2i(7, 4), U, 1),
]

# テスト用
var start_frame := 0


func _ready() -> void:
    # frameの降順にソート
    data.sort_custom(
        func(a: Task, b: Task): return a.frame > b.frame
    )
