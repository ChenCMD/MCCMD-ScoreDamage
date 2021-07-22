# MCCMD-ScoreDamage
防御を貫通しないダメージを与えることのできるライブラリ

対応バージョン: **1.16~**

- [MCCMD-ScoreDamage](#mccmd-scoredamage)
  - [DL](#dl)
  - [依存ライブラリについて](#依存ライブラリについて)
  - [使い方](#使い方)
    - [とりあえず防御非貫通のダメージを与えたい](#とりあえず防御非貫通のダメージを与えたい)
    - [細かく条件を決めてダメージを与えたい](#細かく条件を決めてダメージを与えたい)
  - [要注意事項](#要注意事項)
  - [既知のバグ](#既知のバグ)
  - [推奨利用環境](#推奨利用環境)

---
## DL
[こちら](https://github.com/ChenCMD/MCCMD-ScoreDamage/releases/tag/2.0)からAssets -> MCCMD-ScoreDamage.zip をDLしてください

## 依存ライブラリについて
このライブラリでプレイヤーにダメージを与える場合、赤石愛氏作成の[ScoreToHealth](https://github.com/Ai-Akaishi/ScoreToHealth)を導入する必要があります。

## 使い方

### とりあえず防御非貫通のダメージを与えたい
```mcfunction
# 与えたいダメージを設定 (小数点2桁まで有効)
data merge storage score_damage: {Damage:10.00}
# 対象を実行者にしてfunctionを実行
execute as 対象 run function score_damage:api/attack
```

### 細かく条件を決めてダメージを与えたい

| 引数名 | 説明 |
| -: | :- |
| Damage | 与えたいダメージ (小数点2桁まで有効) |
| EPF | 軽減効果のある[エンチャントプロテクションファクター](https://minecraft.gamepedia.com/Armor#Enchantments)の合計値 <br> 0以上の値が設定されている場合はその値を, 設定されていない場合はProtectionを自動的に参照します。|
| BypassArmor | 防具による軽減を無視するか否か <br> default: false |
| BypassResistance | 耐性エフェクトによる軽減を無視するか否か <br> default:false |
| DisableParticle | ダメージを与えた際にパーティクルを出すか否か <br> default:false |

```mcfunction
# 引数を設定
data merge storage score_damage: {Damage:10.00f,EPF:0,BypassArmor:true/false,BypassResistance:true/false,DisableParticle:true/false}
# 対象を実行者にしてfunctionを実行
execute as 対象 run function score_damage:api/attack
```

## 要注意事項
* Damageに2147.47fよりも大きい値を入れるとオーバーフローし、正常に計算ができないよ
* 実行者はHealthを持つEntityを持つEntityである必要があるよ

## 既知のバグ
* `generic.max_health`に1よりも小さい値を入れれないため、軽減結果が1よりも低いダメージでプレイヤーを殺すことができない

## 推奨利用環境
[Data-pack Helper Plus](https://github.com/SPGoding/datapack-language-server)(通称DHP)を導入した[VSCode](https://azure.microsoft.com/ja-jp/products/visual-studio-code/)での使用

DHPを導入した環境の場合, 上記のfunction名にカーソルを合わせると必要な引数が確認できます。
