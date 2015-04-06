class AddSkillToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :skill, :integer
  end

end
