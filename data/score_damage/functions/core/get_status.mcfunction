#> score_damage:core/get_status
#
# 計算に必要なMobの情報を取得する
#
# @within function score_damage:core/attack

# HP
    execute store result score $Health ScoreDamageCore run data get entity @s Health 10000
# 防御力
    execute if score $BypassArmor ScoreDamageCore matches 0 store result score $defensePoints ScoreDamageCore run attribute @s generic.armor get 100
    execute if score $BypassArmor ScoreDamageCore matches 1 run scoreboard players set $defensePoints ScoreDamageCore 0
# 防具強度
    execute if score $BypassArmor ScoreDamageCore matches 0 store result score $toughness ScoreDamageCore run attribute @s generic.armor_toughness get 100
    execute if score $BypassArmor ScoreDamageCore matches 1 run scoreboard players set $toughness ScoreDamageCore 0
# EPFが未設定または-1以下の時Protectionを参照
    execute unless score $EPF ScoreDamage matches 0.. run function score_damage:core/get_default_epf
# 耐性エフェクト
    execute if score $BypassResistance ScoreDamageCore matches 0 store result score $Resistance ScoreDamageCore run data get entity @s ActiveEffects[{Id:11b}].Amplifier
    execute if score $BypassResistance ScoreDamageCore matches 0 run scoreboard players add $Resistance ScoreDamageCore 1
    execute if score $BypassResistance ScoreDamageCore matches 1 run scoreboard players set $Resistance ScoreDamageCore 0