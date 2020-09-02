#> score_damage:core/health_subtract
#
# MobのHealthを減算する
#
# @within function score_damage:core/attack

# MobのHealthよりダメージが高い場合Healthに設定
    scoreboard players operation $Damage ScoreDamageCore < $Health ScoreDamageCore
# Health減算
    scoreboard players operation $Health ScoreDamageCore -= $Damage ScoreDamageCore
# Mobへ代入
    execute if score $Health ScoreDamageCore matches 1.. store result entity @s Health float 0.0001 run scoreboard players get $Health ScoreDamageCore
    execute if score $Health ScoreDamageCore matches ..0 run data modify entity @s Health set value 00.0001f
    execute if score $Health ScoreDamageCore matches ..0 run kill @s
# 演出
    execute if score $Health ScoreDamageCore matches 1.. if entity @s[type=#score_damage:undead] run effect give @s instant_health 1 31 true
    execute if score $Health ScoreDamageCore matches 1.. if entity @s[type=!#score_damage:undead] run effect give @s instant_damage 1 31 true
    execute if score $DisableParticle ScoreDamageCore matches 0 at @s run function score_damage:core/damage_indicator
# リセット
    scoreboard players reset $Damage ScoreDamageCore
    scoreboard players reset $Health ScoreDamageCore