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

    C_HASH = {"USD" => "米ドル",
               "EUR" => "ユーロ",
               "AUD" => "豪ドル",
               "GBP" => "英ポンド",
               "NZD" => "NZドル",
               "CAD" => "カナダドル",
               "CHF" => "スイスフラン",
               "ZAR" => "ランド",
               "CNH" => "人民元"}

    def send_notif(text)
        Slack.configure do |config|
            config.token = TOKEN
        end
        Slack.chat_postMessage(text: text, username: BOT_NAME, channel: CHANNEL)
    end

    def get_weather()
        uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
        json = Net::HTTP.get(uri)
        result = JSON.parse(json)
        text =  result['description']['text'].delete("\n")
        text = text.gsub(" ", "")  
        text = `python3 text_operation.py #{text}`
        return text
        """
        p result['forecasts'][0]['telop']
        p result['forecasts'][0]['temperature']['max']['celsius']
        p result['forecasts'][1]['telop'] #明日の天気
        p result['forecasts'][1]['temperature']['min']['celsius'] #明日の最低気温
        end
        "
    end

    def get_exchange(currency)
        c_array = []
        if currency == "ALL" 
            c_array = C_HASH.keys
        else
            c_array << currency
        end
        if !C_HASH.key?(currency) and currency != "ALL"
            puts "C_HASH does not have this key."
            exit
        end

        text = "為替レート"
        for c in c_array 
            url = 'http://info.finance.yahoo.co.jp/fx/detail/?code=' + c + 'JPY=FX'
            doc = Nokogiri::HTML(open(url))
            bid = doc.xpath("//*[@id='" + c + "JPY_detail_bid']").text
            ask = doc.xpath("//*[@id='" + c + "JPY_detail_ask']").text
            text += "\n" + C_HASH[c] + ":Bid(売値):#{bid} Ask(買値):#{ask}"
        end
        return text
    end

end

#Use example
"""
class Main
  include GenConAPI
end

main = Main.new
puts main.get_exchange("ALL")
main.send_notif(main.get_exchange("ALL"))
"""
