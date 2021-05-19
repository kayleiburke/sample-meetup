class Engagement < ApplicationRecord
  belongs_to :user
  belongs_to :group
  enum role: [:organizer, :participant, :presenter]
  validates :user, uniqueness: { scope: [:group, :role], message: "/Group/Role combination already exists." }

  def stringify
    "User: " + self.user.full_name + ", Group: " + self.group.name + ", Role: " + self.role
  end
end
