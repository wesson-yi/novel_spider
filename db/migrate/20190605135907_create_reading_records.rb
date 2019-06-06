class CreateReadingRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :reading_records do |t|
      t.integer :book_id, null: false, comment: '书 id'
      t.integer :user_id, null: false, comment: '用户 id'
      t.integer :latest_chapter_id, comment: '最近阅读章节 id'

      t.timestamps
      t.index [:book_id, :user_id]
    end
  end
end
