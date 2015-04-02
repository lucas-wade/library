class Topic < ActiveRecord::Base
  has_many :parent_families, class_name:  'Family',
           foreign_key: 'kid_id',
           dependent:   :destroy

  has_many :parents, through: :parent_families


  has_many :kid_families, class_name:  'Family',
           foreign_key: 'parent_id',
           dependent:   :destroy

  has_many :kids, through: :kid_families

  #translationships
  has_many :original_topic_translationships, class_name:  'TopicTranslationship',
           foreign_key: 'translation_id',
           dependent:   :destroy

  has_many :originals, through: :original_topic_translationships


  has_many :translation_topic_translationships, class_name:  'TopicTranslationship',
           foreign_key: 'original_id',
           dependent:   :destroy

  has_many :translations, through: :translation_topic_translationships



  has_many :pub_attachmentships, class_name:  'Attachmentship',
           foreign_key: 'topic_id',
           dependent:   :destroy

  has_many :pubs, through: :pub_attachmentships




  accepts_nested_attributes_for :kids
  accepts_nested_attributes_for :parents
  accepts_nested_attributes_for :parent_families
  accepts_nested_attributes_for :kid_families
  accepts_nested_attributes_for :pub_attachmentships
  accepts_nested_attributes_for :pubs

#for the pub babies
  #not working
  # not USING

  def add_pub_child(pub)
    #pub_pub_topic_relationships.create(publication_id: publication.id)
  end

  # Unfollows a user.
  def remove_pub_child(other_user)
    #pub_pub_topic_relationships.find_by(publication_id: publication.id).destroy
  end

#for the translations

  # Follows a user.
  def translation_of(original_topic)
    original_topic_translationships.create(original_id: original_topic.id)
  end

  # Unfollows a user.
  def not_translation_of(other_user)
    original_topic_translationships.find_by(original_id: original_topic.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    #following.include?(other_user)
  end



  # Become child of topic.
  def make_parent(parent_topic)
    parent_families.create(parent_id: parent_topic.id)
  end

  def remove_parent(parent_topic)
    parent_families.find_by(parent_id: parent_topic.id).destroy
  end

end
