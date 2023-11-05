extends Node

## ゲームスプライトの基本倍率
const BASE_SCALE := 4

## ゲーム盤面のセルサイズ(px)
const CELL_SIZE := 16 * BASE_SCALE 

## セルの縦横最大値
const CELL_W := 7
const CELL_H := 7

## 移動/攻撃方向
enum Dir {
    UP = 0b0001,
    DOWN = 0b0010,
    LEFT = 0b0100,
    RIGHT = 0b1000,
}
