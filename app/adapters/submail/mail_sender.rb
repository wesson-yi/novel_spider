# rubocop:disable Metrics/AbcSize
class Submail::MailSender
  def send(options)
    response = RestClient.post(
      URI.join(Settings.vendors.submail.host, Settings.vendors.submail.mail_send_path).to_s,
      appid: Settings.submail.email.appid,
      signature: Settings.submail.email.appkey,
      to: options[:to],
      from: options[:from],
      subject: options[:subject],
      html: options[:content]
    )

    if JSON.parse(response.body)['status'] != 'success'
      raise AdapterError, "邮件发送失败: #{JSON.parse(response.body)['msg']}"
    end
  end

  class AdapterError < StandardError
    def initialize(msg)
      super
    end
  end
end
# rubocop:enable Metrics/AbcSize
