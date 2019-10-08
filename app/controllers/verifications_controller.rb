class VerificationsController < ApplicationController
  def create
    # TODO: 限定接口访问频率
    mobile = params.require(:mobile)

    verification_token = Verification.generate(mobile)
    SendSmsJob.perform_now to: mobile, template: 'verification_code', code: verification_token.token
    render plain: '验证码发送成功！请注意查收。', status: :ok
  end
end
