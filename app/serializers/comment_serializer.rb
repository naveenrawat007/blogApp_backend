class CommentSerializer < ActiveModel::Serializer
  attributes :id
  def attributes(*args)
    data = super
    data[:id] = object.id
    data[:title] = object.title
    data[:description] = object.description
    data
  end
end
