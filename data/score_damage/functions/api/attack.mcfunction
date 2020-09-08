#> score_damage:api/attack
#
# 実行者のエンティティにダメージを与えます。
#
# 実行者はHealthを持つEntityである必要があります。
#
# @input **storage score_damage:**
#   **Damage**: float
#       与えるダメージを入力
#   **EPF**: int
#       軽減効果のある[エンチャントプロテクションファクター](https://minecraft.gamepedia.com/Armor#Enchantments)の合計値
#   **DisableParticle**: boolean
#       パーティクルを表示するか否か, bool値
#   **BypassArmor**: boolean
#       防御力/防具強度を無視するか否か, bool値
#   **BypassResistance**: boolean
#       耐性エフェクトを無視するか否か, bool値
# @context EPFが-1以下の時 EntityのProtectionを参照します
# @api

#> Temp
# @internal
    #declare team Null

# 引数チェック
    execute unless data storage score_damage: Damage run tellraw @a [{"text":"ERROR >>","color":"red"},{"text":"引数が足りません","color":"white"},{"text":"\nMissing Damage at score_damage:api/attack","color":"white"}]
# Healthを持つEntityであれば実行
    execute if data storage score_damage: Damage if entity @s[team=!Null] run function score_damage:core/attack