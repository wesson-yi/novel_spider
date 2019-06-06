class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, comment: '用户名'
      t.string :nick_name, comment: '用户昵称'
      t.string :mobile, comment: '手机号'
      t.string :email, comment: '邮箱'

      t.string :password_digest, comment: '密码摘要'
      t.string :remember_digest, comment: '记住用户登录摘要'
      t.boolean :admin, default: false, comment: '是否为管理员'

      t.string :activation_digest, comment: '邮箱激活摘要'
      t.boolean :activated, default: false, comment: '邮箱是否已激活'
      t.datetime :activated_at, comment: '激活时间'

      t.timestamps

      t.index :name
      t.index :mobile
      t.index :email
    end
  end
end
