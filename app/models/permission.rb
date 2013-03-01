# == Schema Information
#
# Table name: permissions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  thing_id   :integer
#  thing_type :string(255)
#  action     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Permission < ActiveRecord::Base
  attr_accessible :user, :action, :thing
  belongs_to :user
  belongs_to :thing, :polymorphic => true
end
