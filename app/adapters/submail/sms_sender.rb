class Submail::SmsSender
  def send(options)
    response = RestClient.post(
      'https://api.mysubmail.com/message/send.json',
      appid: Settings.reminder.sms.submail.appid,
      signature: Settings.reminder.sms.submail.appkey,
      to: options[:to],
      content: options[:content]
    )

    if JSON.parse(response.body)['status'] != 'success'
      raise AdapterError, "短信发送失败: #{JSON.parse(response.body)['msg']}"
    end
  end

  class AdapterError < StandardError
    def initialize(msg)
      super
    end
  end
end
