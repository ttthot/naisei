 #  処理機能は以下にある
 # TODO webhookを使う場合はそれらのファイルも追記
 require_relative "../app/services/line_service"
 service = LineService.new
 #  service.send_line_message("xxxxxx")
 service.send_notification_time_selector
