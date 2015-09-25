class Topic < ActiveRecord::Base
  include Bootsy::Container

  attr_accessor :major_update
  attr_accessor :create_cat_1
  attr_accessor :create_cat_2
  attr_accessor :create_cat_3
  attr_accessor :create_cat_4


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


# pub attachments
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

  mount_uploader :icon, IconUploader


#for the pub babies
  #not working
  # not USING

  #def add_pub_child(pub)
    #pub_pub_topic_relationships.create(publication_id: publication.id)
  #end

  # Unfollows a user.
  #def remove_pub_child(other_user)
    #pub_pub_topic_relationships.find_by(publication_id: publication.id).destroy
  #end

#for the translations

  # becomes a new translation "follow"
  def translation_of(original_topic)
    original_topic_translationships.create(original_id: original_topic.id)
  end

  # Unfollows a user.
  def not_translation_of(original_topic)
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


  def self.search_name(query)
    where("name like ?", "%#{query}%")
  end

  def self.search_main_content(query)
    where("main_content like ?", "%#{query}%")
  end

  def col_finder
    t = self.parents.first || self
    while t.parents.present?
      t = t.parents.first
    end
    if t.id.present?
      t.id
    else
      1
    end
  end

  def create_all_translations

    Topic.create(language: 'es', category: 0, skill: 0, placeholder: TRUE, name: 'es', original_id: self.id)

  end

  def all_translations_exist?
    count = 1
    $av_langs_hash.each do |k,v| unless k == 'na'
      if self.translations.include?(k)
        count+=1
      end
                                  end
    end

    if count == $av_langs_hash.count
      TRUE
    else
      FALSE
    end
  end

  def has_sub_cats?
    if self.id < 4
      return FALSE
    end
    self.kids.each do |t|
      if t.category > 0
        return TRUE
      end
    end
  end

  def peak
    if self.category == 4
      return self
    else if self.category == 0
        return t = self.kids.find_by(category: 4)
    else if self.category > 0
      self.parents.first.kids.find_by(category: 4)
    end
    end
  end
  end

  def introduction
    if self.category == 0
      return self
    else if self.category > 0
      return t = self.parents.first
    end
    end
  end

  def cat1
    if self.category == 1
      return self
      else if self.category == 0
       return t = self.kids.find_by(category: 1)
      else
        self.parents.first.kids.find_by(category: 1)
      end
    end
  end

  def cat2
    if self.category == 2
      return self
      else if self.category == 0
       return t = self.kids.find_by(category: 2)
      else
        self.parents.first.kids.find_by(category: 2)
      end
    end
  end

  def cat3
    if self.category == 3
      return self
      else if self.category == 0
       return t = self.kids.find_by(category: 3)
      else
        self.parents.first.kids.find_by(category: 3)
      end
    end
  end

  def is_sub_cat?
    if self.category && self.category > 0
      return TRUE
    end
  end

end
