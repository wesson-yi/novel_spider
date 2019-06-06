class BookSerializer < ActiveModel::Serializer
  attributes :ywid, :latest_chapter_ywid

  def latest_chapter_ywid
    object.chapters.last&.ywid
  end
end
