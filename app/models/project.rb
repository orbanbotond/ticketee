# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ActiveRecord::Base

  attr_accessible :description, :name
  validates :name, :presence => true, :uniqueness => true

  has_many :permissions, :as => :thing
  has_many :tickets, :dependent => :destroy

  def self.viewable_by(user)
    joins(:permissions).where(:permissions => { :action => "view",
                                                :user_id => user.id })
  end

end
