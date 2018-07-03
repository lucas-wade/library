class Attachmentship < ActiveRecord::Base

  belongs_to :topic, class_name: "Topic"
  belongs_to :pub, class_name: "Pub"
end
