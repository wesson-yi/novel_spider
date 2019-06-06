class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.integer :book_id, null: false, comment: '所属书 id'
      t.integer :ywid, null: false, comment: '章节起点中文网 id'
      t.string :name, comment: '章节名称'

      t.timestamps
    end
  end
end
