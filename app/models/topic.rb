class Topic < ActiveRecord::Base
  has_many :parent_families, class_name:  'Family',
           foreign_key: 'kid_id',
           dependent:   :destroy

  has_many :parents, through: :parent_families


  has_many :kid_families, class_name:  'Family',
           foreign_key: 'parent_id',
           dependent:   :destroy

  has_many :kids, through: :kid_families

  accepts_nested_attributes_for :kids
  accepts_nested_attributes_for :parents
  accepts_nested_attributes_for :parent_families
  accepts_nested_attributes_for :kid_families




  # Become child of topic.
  def make_parent(parent_topic)
    parent_families.build(parent_id: parent_topic.id)
  end

  def remove_parent(parent_topic)
    parent_families.find_by(parent_id: parent_topic.id).destroy
  end

end
