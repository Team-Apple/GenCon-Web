# encoding: utf-8
require "slack"
require 'net/http'
require 'uri'
require 'json'
require 'nokogiri'
require 'open-uri'

module GenConAPI
    TOKEN = ENV["SLACK_TOKEN"]
    BOT_NAME = "GenCon"
    CHANNEL = "04_りんご組"

    CJ_HASH = {"USD" => "米ドル",
               "EUR" => "ユーロ",
               "AUD" => "豪ドル",
               "GBP" => "英ポンド",
               "NZD" => "NZドル",
               "CAD" => "カナダドル",
               "CHF" => "スイスフラン",
               "ZAR" => "ランド",
               "CNH" => "人民元"}

    CB_HASH = {"USD" => "米ドル",
               "ISK" => "アイスランドクローナ",
               "HKD" => "香港ドル",
               "TWD" => "新台湾ドル",
               "CHF" => "スイスフラン",
               "EUR" => "ユーロ",
               "DKK" => "デンマーククローネ",
               "CLP" => "チリペソ",
               "CAD" => "カナダドル",
               "INR" => "インドルピー",
               "CNY" => "人民元",
               "THB" => "タイバーツ",
               "AUD" => "豪ドル",
               "SGD" => "シンガポールドル",
               "KRW" => "韓国ウォン",
               "JPY" => "日本円",
               "PLN" => "ポーランドズウォティ",
               "GBP" => "英ポンド",
               "SEK" => "スウェーデンクローナ",
               "NZD" => "ニュージーランドドル",
               "BRL" => "ブラジルレアル",
               "RUB" => "ロシアルーブル"}

    def send_notif(text)
        Slack.configure do |config|
            config.token = TOKEN
        end
        Slack.chat_postMessage(text: text, username: BOT_NAME, channel: CHANNEL)
    end

    def get_weather(local)
        uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
        json = Net::HTTP.get(uri)
        result = JSON.parse(json)
        text =  result['description']['text'].delete("\n")
        text = text.gsub(" ", "")  

        if local =="N"
            return text
        else
            text = `python3 text_operation.py #{text} #{local}`
            return text
        end
    end

    def get_B_exchange(currency,mode)
        c_array = []
        if currency == "ALL" 
            c_array = CB_HASH.keys
        else
            c_array << currency
        end
        if !CB_HASH.key?(currency) and currency != "ALL"
            return "CB_HASH does not have this key."
        end

        text = "ビットコインの為替情報です。１ビットコインの"if mode == "BTC_T"
        text = "<ビットコインの為替情報>\n"if mode == "BTC_R"
        for c in c_array 
            uri = URI.parse('https://blockchain.info/ja/ticker')
            json = Net::HTTP.get(uri)
            result = JSON.parse(json)
            bid = result[c]['sell']
            ask = result[c]['buy']
            if mode == "BTC_R"
                sym = result[c]['symbol']
                text += "#{CB_HASH[c]}\n売値:#{sym}#{bid} 買値#{sym}#{ask}\n"
            else
                text += "#{CB_HASH[c]}の売値は#{bid}#{CB_HASH[c]}で、買値は#{ask}#{CB_HASH[c]}です。"
            end
        end
        return text
    end

    def get_J_exchange(currency,mode)
        c_array = []
        if currency == "ALL" 
            c_array = CJ_HASH.keys
        else
            c_array << currency
        end
        if !CJ_HASH.key?(currency) and currency != "ALL"
            return "CJ_HASH does not have this key."
        end

        text = "海外通貨の為替情報です。"if mode == "JPY_T"
        text = "<海外通貨の為替情報>\n"if mode == "JPY_R"
        for c in c_array 
            url = 'http://info.finance.yahoo.co.jp/fx/detail/?code=' + c + 'JPY=FX'
            doc = Nokogiri::HTML(open(url))
            bid = doc.xpath("//*[@id='" + c + "JPY_detail_bid']").text
            ask = doc.xpath("//*[@id='" + c + "JPY_detail_ask']").text
            text += "#{CJ_HASH[c]}の売値は#{bid}円で，買値は#{ask}円です。"if mode == "JPY_T"
            text += "#{CJ_HASH[c]}\n売値:¥#{bid} 買値：¥#{ask}\n"if mode == "JPY_R"
        end
        return text
    end

    def get_exchange(currency,mode)
        if mode == "BTC_T" || mode == "BTC_R"
            return get_B_exchange(currency,mode)
        elsif mode == "JPY_T" || mode == "JPY_R"
            return get_J_exchange(currency,mode)
        else
            return "get_exchange:argment error.mode argment is BTC or JPY"
        end
    end

end

#Use example
"""
class Main
  include GenConAPI
end

main = Main.new
main.send_notif(main.get_exchange('ALL','BTC_T') + main.get_exchange('ALL','BTC_R'))
"""
