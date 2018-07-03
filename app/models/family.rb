class Family < ActiveRecord::Base

  belongs_to :parent, class_name: "Topic"
  belongs_to :kid, class_name: "Topic"

  validates :parent_id, presence: true
  validates :kid_id, presence: true

end
