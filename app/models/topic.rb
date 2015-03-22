class Topic < ActiveRecord::Base
  has_many :parent_families, class_name:  'Family',
           foreign_key: 'kid_id',
           dependent:   :destroy

  has_many :parents, through: :parent_families


  has_many :kid_families, class_name:  'Family',
           foreign_key: 'parent_id',
           dependent:   :destroy

  has_many :kids, through: :kid_families



  # Become child of topic.
  def make_parent(parent_topic)
    parent_families.create(parent_id: parent_topic.id)
  end


end
