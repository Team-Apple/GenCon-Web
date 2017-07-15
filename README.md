# README

## Environment

* Ruby : 2.4.1

* Rails: 5.1.1

* yarn : 0.24.6

## Service

Event registration and setting for those. Works in GenCon System.

## How to run

Install all packages.

`$ bundle install`

Database migration.

`$ rake db:migrate`

If you make some test, run this.

`$ rake test`

Stand up the server.

`$ rails s`

then access to `localhost:3000`.

# GenConAPI
<font color="return"></font>
## First
Set environment variable.  
`$ export SLACK_TOKEN=our token`

include example  
```
class Main
  include GenConAPI
end

main = Main.new
```  

## Functions
**send_notif(_String_)**  
**return (_void_)**

Send argument text to our slack channel.  
You have to edit constant (`BOT_NAME` and `CHANNEL`) in `genconAPI.rb` if you want to change them.  

example  
```
main.send_notif("test message")
```

***
**get_weather(_String_)**  
**return (_String_)**

You must choose argument from below. 　    
*"東京地方" => "東京地方の天気予報概況"*　　　  
*"関東甲信地方" => "関東甲信地方の天気予報概況"*　　  
*"ALL" => "すべての地方の天気予報概況"*　　   
*"N" => "すべての地方の天気予報概況（【と】を含む）"*    
  
  
Get the general weather situation in Tokyo form  
<http://weather.livedoor.com/weather_hacks/>.  
This function use `text_operation.py` because the general weather situation has some 【 and 】.  
`text_operation.py` delete them.  

example
```
puts main.get_weather("東京地方")
```

***
**get_exchange(_String_，_String_)**  
**return (_String_)**

Get JPY exchange rate from  
<https://info.finance.yahoo.co.jp/fx/>.  
Or BTC exchange rate from  
<https://blockchain.info/ja/ticker>.  

You must choose second argument from below.  

*"JPY_T" => "日本円の為替レートを文章として取得"*    
*"JPY_R" => "日本円の為替レートを表示用として取得*    
*"BTC_T" => "ビットコインの為替レートを文章として取得"*    
*"BTC_R" => "ビットコインの為替レートを表示用として取得"*   

You must choose first argument from below if you chose "JPY_X" in second argument.  

*"USD" => "米ドル"*      
*"EUR" => "ユーロ"*  
*"AUD" => "豪ドル"*  
*"GBP" => "英ポンド"*   
*"NZD" => "NZドル"*  
*"CAD" => "カナダドル"*    
*"CHF" => "スイスフラン"*  
*"ZAR" => "ランド"*  
*"CNH" => "人民元"*　　  
*"ALL" => "上記のレート全て取得"*　　　  

Or you chose "BTC_X".  
  
*"USD" => "米ドル"*  
*"ISK" => "アイスランドクローナ"*  
*"HKD" => "香港ドル"*  
*"TWD" => "新台湾ドル"*  
*"CHF" => "スイスフラン"*  
*"EUR" => "ユーロ"*  
*"DKK" => "デンマーククローネ"*  
*"CLP" => "チリペソ"*  
*"CAD" => "カナダドル"*  
*"INR" => "インドルピー"*  
*"CNY" => "人民元"*  
*"THB" => "タイバーツ"*  
*"AUD" => "豪ドル"*  
*"SGD" => "シンガポールドル"*  
*"KRW" => "韓国ウォン"*  
*"JPY" => "日本円"*  
*"PLN" => "ポーランドズウォティ"*  
*"GBP" => "英ポンド"*  
*"SEK" => "スウェーデンクローナ"*  
*"NZD" => "ニュージーランドドル"*  
*"BRL" => "ブラジルレアル"*  
*"RUB" => "ロシアルーブル"*   
*"ALL" => "上記のレート全て取得"*　　　 

example
```
puts main.get_exchange("USD","JPY_T)
puts main.get_exchange("ALL",BTC_R)
```
