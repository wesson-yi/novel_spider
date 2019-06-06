class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :ywid, null: false, comment: '起点中文网书 id'
      t.string :name, null: false, comment: '书名'
      t.string :author_name, null: false, comment: '作者名'

      t.timestamps
    end
  end
end
