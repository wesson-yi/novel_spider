class BookSerializer < ActiveModel::Serializer
  attributes :ywid, :name, :latest_chapter

  def latest_chapter
    { ywid: object.chapters.last&.ywid, name: object.chapters.last&.name }
  end
end
