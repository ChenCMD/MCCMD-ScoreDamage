#> score_damage:core/get_default_epf
#
# プロテクションのEPFを取得します
#
# @within function score_damage:core/get_status

#> Temp
# @private
    #declare score_holder $Temp

# 明示的に0に設定
    scoreboard players set $EPF ScoreDamageCore 0
# 足
    execute store result score $Temp ScoreDamageCore run data get entity @s ArmorItems[0].tag.Enchantments[{id:"minecraft:protection"}].lvl
    scoreboard players operation $EPF ScoreDamageCore += $Temp ScoreDamageCore
# 脚
    execute store result score $Temp ScoreDamageCore run data get entity @s ArmorItems[1].tag.Enchantments[{id:"minecraft:protection"}].lvl
    scoreboard players operation $EPF ScoreDamageCore += $Temp ScoreDamageCore
# 胸
    execute store result score $Temp ScoreDamageCore run data get entity @s ArmorItems[2].tag.Enchantments[{id:"minecraft:protection"}].lvl
    scoreboard players operation $EPF ScoreDamageCore += $Temp ScoreDamageCore
# 頭
    execute store result score $Temp ScoreDamageCore run data get entity @s ArmorItems[3].tag.Enchantments[{id:"minecraft:protection"}].lvl
    scoreboard players operation $EPF ScoreDamageCore += $Temp ScoreDamageCore
# リセット
    scoreboard players reset $Temp ScoreDamageCore