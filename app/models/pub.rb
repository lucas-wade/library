class Pub < ActiveRecord::Base

  has_many :topic_attachmentships, class_name:  'Attachmentship',
           foreign_key: 'pub_id',
           dependent:   :destroy


  has_many :topics, through: :topic_attachmentships

  mount_uploader :media, MediaUploader

  # Become child of topic.
  def make_parent(parent_topic)
    topic_attachmentships.create(topic_id: parent_topic.id)
  end

  def remove_parent(p_topic)
    topic_attachmentships.find_by(topic_id: p_topic.id).destroy
  end
end
