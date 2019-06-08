class Fake::MailSender
  def send(options)
    to_address, to_name = MailUtils.parse_content(options[:to])
    from_address, from_name = MailUtils.parse_content(options[:from])

    response = RestClient.post(
      URI.join(Settings.vendors.fake.host, '/emails').to_s,
      toAddress: to_address,
      toName: to_name,
      fromAddress: from_address,
      fromName: from_name,
      subject: options[:subject],
      content: options[:content],
      type: 'html'
    )

    raise AdapterError, "邮件发送失败: #{response.body}" if response.body != 'created'
  end

  class AdapterError < StandardError
    def initialize(msg)
      super
    end
  end
end
