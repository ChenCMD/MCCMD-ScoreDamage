# MCCMD-ScoreDamage
防御を貫通しないダメージを与えることのできるライブラリ

対応バージョン: **1.16~**

---
## DL
[こちら](https://github.com/ChenCMD/MCCMD-ScoreDamage/releases/latest/download/MCCMD-ScoreDamage.zip)をDLしてください

## 依存ライブラリについて
このライブラリでプレイヤーにダメージを与える場合、赤石愛氏作成の[ScoreToHealth](https://github.com/Ai-Akaishi/ScoreToHealth)を導入する必要があります。

## 使い方

### とりあえず防御非貫通のダメージを与えたい
```mcfunction
# 与えたいダメージを設定 (小数点2桁まで有効)
  data modify storage score_damage: Argument set value {Damage:10.00}
# 対象を実行者にしてfunctionを実行
  execute as <対象> run function score_damage:api/attack
```

### 細かく条件を決めてダメージを与えたい

|                    引数名 | 必須  |            型             | 説明                                                                                                                                                                                                                              | デフォルト |
| ------------------------: | :---: | :-----------------------: | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------: |
|           Argument.Damage |   o   |          double           | 与えたいダメージ (小数点2桁まで有効)                                                                                                                                                                                              |     -      |
|              Argument.EPF |   x   |            int            | 軽減効果のある[エンチャントプロテクションファクター](https://minecraft.gamepedia.com/Armor#Enchantments)の合計値 <br> 0以上の値が設定されている場合はその値を,<br>設定されていない場合はDamageTypeを元に自動的に計算/参照します。 |    `-1`    |
|       Argument.DamageType |   x   | [DamageType](#DamageType) | ダメージの種類<br>この引数は上記EPFの値が0以上でない場合に対象のエンチャントを自動参照するために利用されます                                                                                                                      |  `"None"`  |
|      Argument.BypassArmor |   x   |          boolean          | 防具による軽減を無視するか否か                                                                                                                                                                                                    |  `false`   |
| Argument.BypassResistance |   x   |          boolean          | 耐性エフェクトによる軽減を無視するか否か                                                                                                                                                                                          |  `false`   |
|  Argument.DisableParticle |   x   |          boolean          | ダメージを与えた際のパーティクルを無効化するか否か                                                                                                                                                                                |  `false`   |

#### DamageType
* `"None"`
* `"Fire"`
* `"Blast"`
* `"Projectile"`
* `"Fall"`

### 例
```mcfunction
# 5m以内のゾンビに火炎耐性でも軽減可能な15ダメージを与える
  # 引数を設定
    data modify storage score_damage: Argument set value {Damage:15.00,DamageType:"Fire"}
  # 対象を実行者にしてfunctionを実行
    execute as @e[type=zombie,distance=..5] run function score_damage:api/attack
  # 引数を明示的にリセット
    data remove storage score_damage: Argument
# 全プレイヤーに耐性エフェクトで軽減できない落下ダメージ10を与える
  # 引数を設定
    data modify storage score_damage: Argument set value {Damage:10.00,DamageType:"Fall",BypassResistance:true}
  # 対象を実行者にしてfunctionを実行
    execute as @a[distance=..5] run function score_damage:api/attack
  # 引数を明示的にリセット
    data remove storage score_damage: Argument
# 一切の軽減が不可能な8ダメージを一番近い村人に与える
  # 引数を設定
    data modify storage score_damage: Argument set value {Damage:8.00,EPF:0,BypassArmor:true,BypassResistance:true}
  # 対象を実行者にしてfunctionを実行
    execute as @e[type=villager,sort=nearest,limit=1] run function score_damage:api/attack
  # 引数を明示的にリセット
    data remove storage score_damage: Argument
```

## 要注意事項
* 実行者はHealthを持つEntityである必要があるよ
* Damageに2147.47よりも大きい値を入れるとオーバーフローし、正常に計算ができないよ
* Argumentは複数を対象にしたapiの実行を想定しているから、実行で自動的にリセットされないよ  
  だからDamage以外の引数を持つ実行の次の行で明示的にリセットすることが推奨されるよ

## 既知のバグ
* `generic.max_health`に1よりも小さい値を入れれないため、軽減結果が1よりも低いダメージでプレイヤーを殺すことができない

## 推奨利用環境
[Data-pack Helper Plus](https://github.com/SPGoding/datapack-language-server)(通称DHP)を導入した[VSCode](https://azure.microsoft.com/ja-jp/products/visual-studio-code/)での使用

DHPを導入した環境の場合, 上記のfunction名にカーソルを合わせると必要な引数が確認できます。
