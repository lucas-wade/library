class Pub < ActiveRecord::Base
  mount_uploader :media, MediaUploader
end
