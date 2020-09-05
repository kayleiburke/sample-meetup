class Group < ApplicationRecord
  has_many :engagements
  has_many :users, through: :engagements
  has_many :organizers, -> { where("engagements.role": 0) }, through: :engagements,  source: :user

  def self.search(query)
    query = query.downcase
    where(["LOWER(name) LIKE ?", "%#{query}%"])
  end
end
