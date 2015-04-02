class TopicTranslationship < ActiveRecord::Base
  belongs_to :original, class_name: "Topic"
  belongs_to :translation, class_name: "Topic"

  validates :original_id, presence: true
  validates :translation_id, presence: true
end
