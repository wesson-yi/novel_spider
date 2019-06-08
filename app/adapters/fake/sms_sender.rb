class Fake::SmsSender
  def send(options)
    response = RestClient.post(
      'http://dev.maikeji.cn:3100/messages',
      toMobile: options[:to],
      content: options[:content]
    )

    raise AdapterError, "短信发送失败: #{response.body}" if response.body != 'created'
  end

  class AdapterError < StandardError
    def initialize(msg)
      super
    end
  end
end
