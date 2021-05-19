class Engagement < ApplicationRecord
  belongs_to :user
  belongs_to :group
  enum role: [:organizer, :participant, :presenter]
  validates :user, uniqueness: { scope: [:group, :role], message: "/Group/Role combination already exists." }
  validate :no_more_than_three_organizers

  def no_more_than_three_organizers
    if self.group.organizers.size >= 3
      errors.add(:group, "already has 3 organizers")
    else
      true
    end

  end

  def stringify
    "User: " + self.user.full_name + ", Group: " + self.group.name + ", Role: " + self.role
  end
end
