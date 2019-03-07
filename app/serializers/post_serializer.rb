class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :created_at, :my_time
  def my_time
    t = self.object.created_at.localtime
    t.strftime('%a %b %d at %I:%M')
  end
end
