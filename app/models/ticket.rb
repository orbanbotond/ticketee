# == Schema Information
#
# Table name: tickets
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :text
#  project_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  asset_file_name    :string(255)
#  asset_content_type :string(255)
#  asset_file_size    :integer
#  asset_updated_at   :datetime
#

class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  attr_accessible :title, :description, :asset

  has_attached_file :asset

  validates :title, :presence => true
  validates :description, :presence => true,
                        :length => { :minimum => 10 }

end
