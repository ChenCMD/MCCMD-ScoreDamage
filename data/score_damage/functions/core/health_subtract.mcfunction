#> score_damage:core/health_subtract
#
# MobのHealthを減算する
#
# @within function score_damage:core/attack

#> Temp
# @private
    #declare objective ScoreToHealth

# MobのHealthよりダメージが高い場合Healthに設定
    scoreboard players operation $Damage ScoreDamageCore < $Health ScoreDamageCore
# Health減算
    scoreboard players operation $SubtractedHealth ScoreDamageCore = $Health ScoreDamageCore
    scoreboard players operation $SubtractedHealth ScoreDamageCore -= $Damage ScoreDamageCore
# Mobへ代入
    # Player
        execute if entity @s[type=player] run scoreboard players operation $Health ScoreDamageCore /= $100 ScoreDamageCore
        execute if entity @s[type=player] run scoreboard players operation $SubtractedHealth ScoreDamageCore /= $100 ScoreDamageCore
        execute if entity @s[type=player] run scoreboard players operation $Damage ScoreDamageCore /= $100 ScoreDamageCore
        execute if entity @s[type=player] unless score @s ScoreToHealth matches 0.. store success score $hasDependency ScoreDamageCore run scoreboard players operation @s ScoreToHealth = $Health ScoreDamageCore
        execute if entity @s[type=player] run scoreboard players operation @s ScoreToHealth -= $Damage ScoreDamageCore
        execute if entity @s[type=player] if score $hasDependency ScoreDamageCore matches 0 run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"ScoreToHealth","underlined":true,"color":"#4c4cff","clickEvent":{"action":"open_url","value":"https://github.com/Ai-Akaishi/ScoreToHealth"}},{"text":"が導入されていないため\nPlayerにダメージを与えることは出来ません","color":"white"}]
    # Mob
        execute if entity @s[type=!player] if score $Health ScoreDamageCore matches 1.. store result entity @s Health float 0.0001 run scoreboard players get $Health ScoreDamageCore
    # Common
        execute if score $Health ScoreDamageCore matches ..0 run kill @s
# 演出
    execute if score $Health ScoreDamageCore matches 1.. if entity @s[type=#score_damage:undead] run effect give @s instant_health 1 30 true
    execute if score $Health ScoreDamageCore matches 1.. if entity @s[type=!#score_damage:undead] if score $Resistance ScoreDamageCore matches ..4 run effect give @s instant_damage 1 30 true
    execute if score $Health ScoreDamageCore matches 1.. if entity @s[type=!#score_damage:undead] if score $Resistance ScoreDamageCore matches 5.. run effect give @s instant_damage 1 0 true
    execute if score $DisableParticle ScoreDamageCore matches 0 at @s run function score_damage:core/damage_indicator
# リセット
    scoreboard players reset $Damage ScoreDamageCore
    scoreboard players reset $Health ScoreDamageCore
    scoreboard players reset $hasDependency ScoreDamageCore
    scoreboard players reset $Resistance ScoreDamageCore