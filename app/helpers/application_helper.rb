module ApplicationHelper
  def admins_only(&block)
    concat(block.call) if current_user.try(:admin?)
  end
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join(" - ")
      end
    end
  end
end
