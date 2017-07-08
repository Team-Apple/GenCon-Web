# README

## Environment

* Ruby : 2.4.1

* Rails: 5.1.1

* yarn : 0.24.6


# How to install yarn?
`$ brew install yarn`


## How to run

`$ bundle install`

then

`$ rails s`

then access to `localhost:3000`.

# GenConAPI

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
**get_weather(_void_)**  
**return (_String_)**

Get the general weather situation in Tokyo form  
<http://weather.livedoor.com/weather_hacks/>.  
This function use `text_operation.py` because the general weather situation has some 【 and 】.  
`text_operation.py` delete them.  
  
example
```
puts main.get_weather
```
  
***
**get_exchange(_String_)**  
**return (_String_)**
  
Get exchange rate from  
<https://info.finance.yahoo.co.jp/fx/>.  
You must choose argument from below.  
  
*"USD" => "米ドル"*      
*"EUR" => "ユーロ"*  
*"AUD" => "豪ドル"*  
*"GBP" => "英ポンド"*   
*"NZD" => "NZドル"*  
*"CAD" => "カナダドル"*    
*"CHF" => "スイスフラン"*  
*"ZAR" => "ランド"*  
*"CNH" => "人民元"*  
  
You can get all exchange rate if you choose *"ALL"*.  
  
example
```
puts main.get_exchange("USD")
puts main.get_exchange("ALL")
```
