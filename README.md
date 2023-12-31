# README
![Nagano Cake](https://github.com/i-osushi/nagano-cake/assets/135219119/695fa230-fc95-4272-82af-192af7979c56)

## アプリケーション名
 「Nagano Cake」

## アプリケーション概要
 長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発です。

## 通販についての説明
 ・通販では注文に応じて製作する受注生産型としている。<br>
 ・現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けない。<br>
 ・送料は1配送につき全国一律800円。<br>
 ・友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できる。<br>
 ・支払方法はクレジットカード、銀行振込から選択できる。

## テスト用アカウント
 管理者<br>
  メールアドレス：osushi@teamI<br>
  パスワード：osushi<br>
  
 顧客<br>
 　　自由に決められます。

## 利用方法
  顧客の場合<br>
  ![顧客側のフロー](https://github.com/i-osushi/nagano-cake/assets/133837502/afecbdb4-7e83-460a-9f7d-e7396c797a90)
  
  管理者の場合<br>
  ![店側のフロー](https://github.com/i-osushi/nagano-cake/assets/133837502/d809995a-ae78-49ac-875c-637a7c526494)
  
## アプリケーション作成に至った背景
  元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。<br>
  InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。

## 用語の定義

 | 用語           | 意味 |
 | -------------- | ---- |
 | 顧客           | 「Nagano Cake」 の商品を購入する人（客）
 | 管理者         | 店で働く事務員・パティシエ等 
 | 注文ステータス | 注文の状態遷移を表す（後述）。
 | 製作ステータス | 注文に紐付く注文商品の状態遷移を表す（後述）。
 | 販売ステータス | 商品の販売状況を表す。現状、販売中、売切れの2パターンがある。<br>販売停止商品は「売切れ」をセットする。
 | 会員ステータス | 現状、有効・退会の2パターンがある。
 | ジャンル       | 商品の種類。
 | 注文個数       | 1回の注文に紐付く注文個数の合計。<br>例）商品Aを3個、商品Bを2個注文→注文個数は5。
 | 商品小計       | 商品単価（税込）×個数<br>例）1,200円（税込）の商品を2個購入＝商品小計は2,400円

## 各種ステータス

 **注文ステータス**
 注文状況を表し、会員の購入履歴にも表示される。
 | ステータス | 設定タイミング |
 | ---------- | -------------- |
 | 入金待ち   | 注文した時点でデフォルトで設定される | 
 | 入金確認   | 事務員が入金を確認したら更新する |
 | 製作中     | 紐づく注文商品の製作ステータスが一つでも「製作中」になったら自動更新される |
 | 発送準備中 | 紐づく注文商品の製作ステータスが全て「製作完了」になったら自動更新される |
 | 発送済み   | 事務員が発送完了時に設定する |

 **製作ステータス**
 各商品の製作状況を表し、内部でのみ使用する。
 | ステータス | 設定タイミング |
 | ---------- | -------------- |
 | 着手不可   | 注文した時点でデフォルトで設定される | 
 | 製作待ち   | 紐づく注文ステータスが「入金確認」になったら自動更新される |
 | 製作中     | 製作着手するタイミングでパティシエが設定する |
 | 製作完了   | 製作が完了したタイミングでパティシエが設定する |

## 設計書
 **ER図**
  ![おすしのER図](https://github.com/i-osushi/nagano-cake/assets/133837502/506837ad-e9f3-4b7d-9fe6-d153d3c0fb65)

## 製作者
 *チームおすし*<br>
 工藤　良介 [(Ryo0203VB)](https://github.com/Ryo0203VB)<br>
 二宮　茉弓 [(NNMY03)](https://github.com/NNMY03)<br>
 安田　奈留美 [(ysdnrm)](https://github.com/ysdnrm)
 
