# MCCMD-ScoreDamage
防御を貫通しないダメージを与えることのできるライブラリ

動作するバージョン: **1.16~**

## DL
[こちら](https://github.com/ChenCMD/MCCMD-ScoreDamage/releases/tag/1.0)からAssets -> MCCMD-ScoreDamage.zip をDLしてください

## 使い方

### とりあえず防御非貫通のダメージを与えたい
```mcfunction
# 与えたいダメージを設定
scoreboard players set $Damage ScoreDamage n
# 対象を実行者にしてfunctionを実行
execute as 対象 run function score_damage:api/attack
```
ダメージを軽減する要素:
* generic.armor
* generic.armor_toughness
* protectionエンチャント
* 耐性エフェクト

### ダメージを与えた時のパーティクルを無くしたい
```mcfunction
# 与えたいダメージを設定
scoreboard players set $Damage ScoreDamage n
# 対象を実行者にしてfunctionを実行
execute as 対象 run function score_damage:api/attack.no_particle
```
ダメージを軽減する要素:
* generic.armor
* generic.armor_toughness
* protectionエンチャント
* 耐性エフェクト


### 参照するエンチャントを爆発耐性,火炎耐性,独自のもの 等にしたい / エンチャントを無視するダメージを与えたい
与えたいダメージを設定する時にこれも設定してね
EPFの決め方は[ここ](https://minecraft.gamepedia.com/Armor#Enchantments)参照してね
EPFを0にするとエンチャントを無視するダメージを与えられるよ
```mcfunction
# Enchantment Protection Factorの略
scoreboard players set $EPF ScoreDamage n
```


### 防具効果を無視するダメージを与えたい
```mcfunction
# 与えたいダメージを設定
scoreboard players set $Damage ScoreDamage n
# 対象を実行者にしてfunctionを実行
execute as 対象 run function score_damage:api/attack.bypass_resistance
```
ダメージを軽減する要素:
* protectionエンチャント
* 耐性エフェクト


### 耐性エフェクト効果を無視するダメージを与えたい
```mcfunction
# 与えたいダメージを設定
scoreboard players set $Damage ScoreDamage n
# 対象を実行者にしてfunctionを実行
execute as 対象 run function score_damage:api/attack.bypass_resistance
```
ダメージを軽減する要素:
* generic.armor
* generic.armor_toughness
* protectionエンチャント


### 自由に無視する要素を決めてダメージを与えたい
```mcfunction
# 与えたいダメージを設定
scoreboard players set $Damage ScoreDamage n
# ダメージを与えた際のパーティクルを表示するか否か
scoreboard players set $DisableParticle ScoreDamage 0 or 1
# 防御力/防具強度を無視するか否か
scoreboard players set $BypassArmor ScoreDamage 0 or 1
# 耐性エフェクトを無視するか否か
scoreboard players set $BypassResistance ScoreDamage 0 or 1

# 対象を実行者にしてfunctionを実行
execute as 対象 run function score_damage:api/attack.custom
```

## 注意点
* 実行者はplayer以外かつHealthを持つEntityを持つEntityである必要があるよ
* $EPFは値が未指定、もしくは-1以下の時 EntiyのProtectionを参照するよ

## 推奨利用環境
[Data-pack Helper Plus](https://github.com/SPGoding/datapack-language-server)(通称DHP)を導入した[VSCode](https://azure.microsoft.com/ja-jp/products/visual-studio-code/)での使用

DHPを導入した環境の場合, 上記のfunction名にカーソルを合わせると必要な引数が確認できます。
