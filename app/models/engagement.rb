class Engagement < ApplicationRecord
  belongs_to :user
  belongs_to :group
  enum role: [:organizer, :participant, :presenter]
  validates :user, uniqueness: { scope: [:group, :role], message: "User/Group/Role combination already exists." }
end
