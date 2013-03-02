# == Schema Information
#
# Table name: tickets
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  state_id    :integer
#

class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :comments
  has_many :assets
  belongs_to :state

  attr_accessible :title, :description, :assets_attributes
  accepts_nested_attributes_for :assets

  validates :title, :presence => true
  validates :description, :presence => true,
                        :length => { :minimum => 10 }

end
