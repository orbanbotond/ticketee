# == Schema Information
#
# Table name: assets
#
#  id                 :integer          not null, primary key
#  asset_file_name    :string(255)
#  asset_file_size    :integer
#  asset_content_type :string(255)
#  asset_updated_at   :datetime
#  ticket_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Asset < ActiveRecord::Base
  attr_accessible :asset
  has_attached_file :asset
end
