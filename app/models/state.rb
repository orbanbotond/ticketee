# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  background :string(255)
#

class State < ActiveRecord::Base
  attr_accessible :background, :color, :name

  def to_s
    name
  end
end
