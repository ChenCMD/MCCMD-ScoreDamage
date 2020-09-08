# MCCMD-ScoreDamage
防御を貫通しないダメージを与えることのできるライブラリ

対応バージョン: **1.16~**

1. [DL](#howToDL)
1. [要注意事項](#precautions)
1. [使い方](#howToUse)
    1. [とりあえず防御非貫通のダメージを与えたい](#1)
    1. [細かく条件を決めてダメージを与えたい](#2)
1. [推奨利用環境](#recommended)

---
<a id="howToDL"></a>
## DL
[こちら](https://github.com/ChenCMD/MCCMD-ScoreDamage/releases/tag/1.0)からAssets -> MCCMD-ScoreDamage.zip をDLしてください

---
<a id="precautions"></a>
## 要注意事項
* このライブラリでプレイヤーにダメージを与える場合、赤石愛氏作成の[ScoreToHealth](https://github.com/Ai-Akaishi/ScoreToHealth)を使用する必要があります。
* Damageに2147.47fよりも大きい値を入れるとオーバーフローし、正常に計算ができないよ
* 実行者はHealthを持つEntityを持つEntityである必要があるよ

---
<a id="howToUse"></a>
## 使い方

<A id="1"></a>
### とりあえず防御非貫通のダメージを与えたい
```mcfunction
# 与えたいダメージを設定 (小数点2桁まで有効)
data merge storage score_damage: {Damage:10.00}
# 対象を実行者にしてfunctionを実行
execute as 対象 run function score_damage:api/attack
```

---
<A id="2"></a>
### 細かく条件を決めてダメージを与えたい

| 引数名 | 説明 |
| -: | :- |
| Damage | 与えたいダメージ (小数点2桁まで有効) |
| EPF | 軽減効果のある[エンチャントプロテクションファクター](https://minecraft.gamepedia.com/Armor#Enchantments)の合計値 <br> 0以上の値が設定されている場合はその値を, 設定されていない場合はProtectionを自動的に参照します。|
| BypassArmor | 防具による軽減を無視するか否か |
| BypassResistance | 耐性エフェクトによる軽減を無視するか否か |
| DisableParticle | ダメージを与えた際にパーティクルを出すか否か |

```mcfunction
data merge storage score_damage: {Damage:10.00f,EPF:0,BypassArmor:true/false,BypassResistance:true/false,DisableParticle:true/false}
# 対象を実行者にしてfunctionを実行
execute as 対象 run function score_damage:api/attack
```

---
<A id="recommended"></a>
## 推奨利用環境
[Data-pack Helper Plus](https://github.com/SPGoding/datapack-language-server)(通称DHP)を導入した[VSCode](https://azure.microsoft.com/ja-jp/products/visual-studio-code/)での使用

DHPを導入した環境の場合, 上記のfunction名にカーソルを合わせると必要な引数が確認できます。
