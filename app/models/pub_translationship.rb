class PubTranslationship < ActiveRecord::Base
  belongs_to :original, class_name: "Pub"
  belongs_to :translation, class_name: "Pub"

  validates :original_id, presence: true
  validates :translation_id, presence: true
end
