class Family < ActiveRecord::Base

  belongs_to :parent, class_name: "Topic"
  belongs_to :kid, class_name: "Topic"

end
