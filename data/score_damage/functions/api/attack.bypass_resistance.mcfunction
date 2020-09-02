#> score_damage:api/attack.bypass_resistance
#
# 実行者のエンティティに **耐性エフェクトを貫通する** ダメージを与えます。
#
# この関数は耐性エフェクトの効果を無視します。
#
# 実行者はplayer以外かつHealthを持つEntityを持つEntityである必要があります。
#
# @input _score_
#   **$Damage ScoreDamage**
#       与えるダメージを100倍し入力
#   **$EPF ScoreDamage**
#       軽減効果のある[エンチャントプロテクションファクター](https://minecraft.gamepedia.com/Armor#Enchantments)の合計値
#
# @! $EPFは値が未指定、もしくは-1以下の時 EntiyのProtectionを参照します
#
# @public

# フラグの設定
    scoreboard players set $DisableParticle ScoreDamageCore 0
    scoreboard players set $BypassArmor ScoreDamageCore 0
    scoreboard players set $BypassResistance ScoreDamageCore 1
# Entityがプレイヤー以外かつHealthを持つEntityであれば実行
    execute if entity @s[team=!null,type=!player] run function score_damage:core/attack