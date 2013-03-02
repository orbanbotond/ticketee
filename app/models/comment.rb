# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  text              :text
#  ticket_id         :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  state_id          :integer
#  previous_state_id :integer
#

class Comment < ActiveRecord::Base
  after_create :set_ticket_state
  before_create :set_previous_state

  belongs_to :ticket
  belongs_to :user
  belongs_to :state
  belongs_to :previous_state, :class_name => "State"

  attr_accessible :text, :state_id
  validates :text, :presence => true

  delegate :project, :to => :ticket

private
    def set_ticket_state
      self.ticket.state = self.state
      self.ticket.save!
    end
    def set_previous_state
      self.previous_state = ticket.state
    end
end
