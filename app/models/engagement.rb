class Engagement < ApplicationRecord
  belongs_to :user
  belongs_to :group
  enum role: [:organizer, :participant, :presenter]
end
