require 'google/api_client/auth/key_utils'
require 'google/apis/calendar_v3'
require 'base32'

module EventMaker
  APPLICATION_NAME = 'ReservationSystem'
  DIR = File.dirname(__FILE__)
  TIME_ZONE = 'Asia/Tokyo'

  class << self
    def load_key
      return Google::APIClient::KeyUtils.load_from_pkcs12("#{DIR}/ressys-key", 'notasecret')
    end

    def to_uid(reserve_id, extra_str="")
      base_str = "#{extra_str}#{ENV['ENV_NAME']}#{reserve_id}"
      return Base32.encode32hex(base_str).gsub("=","")
    end

    def auth()
      return Signet::OAuth2::Client.new(
        :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
        :audience => 'https://accounts.google.com/o/oauth2/token',
        :scope => 'https://www.googleapis.com/auth/calendar',
        :issuer => 'reservationsystem@smart-quasar-142413.iam.gserviceaccount.com',
        :signing_key => load_key())
    end

    def create_event(reservation, extra_str="")
      client = Google::Apis::CalendarV3::CalendarService.new

      client.authorization = auth()

      client.authorization.fetch_access_token!

      #イベントテンプレート
      event_tpl = {
        id: to_uid(reservation.id, extra_str),
        summary: "【仮】" + reservation.group_name,
        #description: description,
        start: {
          date_time: reservation.start_time.iso8601,
          time_zone: TIME_ZONE
        },
        end: {
          date_time: reservation.end_time.iso8601,
          time_zone: TIME_ZONE
        }
      }

      event = Google::Apis::CalendarV3::Event.new(event_tpl)

      result = client.insert_event('coedo.event@gmail.com', event)
      puts "Event created: #{result.html_link}"
      return result.html_link
    end

    def delete_event(reserve_id, extra_str="")
      client = Google::Apis::CalendarV3::CalendarService.new

      key = load_key

      client.authorization = auth()

      client.authorization.fetch_access_token!

      result = client.delete_event('coedo.event@gmail.com',
        to_uid(reserve_id, extra_str))
    end

    def update_event(reservation, extra_str="")

      changed_params = reservation.changed_cols

      puts "changed: #{changed_params}"

      unless changed_params.include?('start_time') or changed_params.include?('end_time') or changed_params.include?('reservation_status')
        puts 'no any changes for gcal, return'
        return
      end

      client = Google::Apis::CalendarV3::CalendarService.new

      key = load_key

      client.authorization = auth()

      client.authorization.fetch_access_token!

      target_event = client.get_event('coedo.event@gmail.com',
        to_uid(reservation.id, extra_str))

      if reservation.reservation_status == "confirmed"
        if target_event.summary.include?("【仮】")
          target_event.summary = reservation.group_name
        end
      elsif reservation.reservation_status == "tentative"
        unless target_event.summary.include?("【仮】")
          target_event.summary.insert(0, "【仮】")
        end
      end

      target_event.start = {
        date_time: reservation.start_time.iso8601,
        time_zone: TIME_ZONE
      }

      target_event.end = {
        date_time: reservation.end_time.iso8601,
        time_zone: TIME_ZONE
      }

      result = client.update_event('coedo.event@gmail.com',
        to_uid(reservation.id, extra_str),
        target_event)
    end
  end
end
