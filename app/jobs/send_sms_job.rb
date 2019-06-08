class SendSmsJob < ApplicationJob
  #
  # options 参数
  #   to 收件人
  #     '15136167907'
  #   template 需要使用的模板
  #     'remind_books_continued'
  #   books 书目更新章节
  #     [{ name: 'name1', latest_chapters: ['chapter1', 'chapter2'] }]
  #

  def perform(options)
    logger.info { "发送短信：#{options}" }
    SmsSender.send(options)
  rescue StandardError => e
    logger.fatal('发送短信出错：')
    logger.fatal(e)
  end

  class SmsSender
    class << self
      def send(options)
        template_path = Rails.root.join('app/views/templates/sms', "#{options[:template]}.txt.erb")
        content = ERBExecutor.execute(File.read(template_path), options).chomp!

        @proxy.send to: options[:to], content: content
      end

      private

      def init_proxy
        @proxy = Settings.reminder.sms.adapter.constantize.new
      end
    end

    init_proxy
  end
end
