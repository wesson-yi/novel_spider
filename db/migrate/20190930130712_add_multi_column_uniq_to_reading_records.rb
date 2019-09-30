class AddMultiColumnUniqToReadingRecords < ActiveRecord::Migration[6.0]
  def change
    remove_index :reading_records, column: [:book_id, :user_id]
    add_index :reading_records, [:book_id, :user_id], unique: true
  end
end
