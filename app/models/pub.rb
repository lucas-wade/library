class Pub < ActiveRecord::Base

  has_many :topic_attachmentships, class_name:  'Attachmentship',
           foreign_key: 'pub_id',
           dependent:   :destroy


  has_many :topics, through: :topic_attachmentships


  #translationships
  has_many :original_pub_translationships, class_name:  'PubTranslationship',
           foreign_key: 'translation_id',
           dependent:   :destroy

  has_many :originals, through: :original_pub_translationships


  has_many :translation_pub_translationships, class_name:  'PubTranslationship',
           foreign_key: 'original_id',
           dependent:   :destroy

  has_many :translations, through: :translation_pub_translationships



  mount_uploader :media, MediaUploader




  # Become child of topic.
  def make_parent(parent_topic)
    topic_attachmentships.create(topic_id: parent_topic.id)
  end

  def remove_parent(p_topic)
    topic_attachmentships.find_by(topic_id: p_topic.id).destroy
  end

  # becomes a new translation "follow"
  def translation_of(original_pub)
    original_pub_translationships.create(original_id: original_pub.id)
  end

  # Unfollows a user.
  def not_translation_of(original_pub)
    original_pub_translationships.find_by(original_id: original_pub.id).destroy
  end

  def self.search_name(query)
    where("name like ?", "%#{query}%")
  end

  def self.search_main_content(query)
    where("main_content like ?", "%#{query}%")
  end

  def self.search_meta_data(query)
    where("meta_data like ?", "%#{query}%")
  end

  def pdf_to_meta_data
    reader = PDF::Reader.new(open("public#{self.media.url}"))
    t = ""
    reader.pages.each do |page|
      t += page.text
    end
    #@pub.meta_data = reader.page(all)
    if self.update_attribute(:meta_data, t)
      TRUE
    else
      FALSE
    end

  end

end



