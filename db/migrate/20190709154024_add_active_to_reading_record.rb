class AddActiveToReadingRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :reading_records, :deleted, :boolean, default: false, after: :latest_chapter_id, comment: '是否删除'
  end
end
