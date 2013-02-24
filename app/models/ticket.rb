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
#

class Ticket < ActiveRecord::Base
  belongs_to :project
  attr_accessible :description, :title
  validates :title, :presence => true
  validates :description, :presence => true,
                        :length => { :minimum => 10 }

  attr_accessible :description, :title
  belongs_to :user
end
