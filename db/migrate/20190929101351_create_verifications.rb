class CreateVerifications < ActiveRecord::Migration[6.0]
  def change
    create_table :verifications do |t|
      t.string :digest, null: false, comment: '验证码'
      t.string :source, null: false, comment: '手机号/邮箱'
      t.datetime :expired_at, comment: '失效时间'
      t.integer :available_times, comment: '可使用次数'

      t.timestamps
    end
  end
end
