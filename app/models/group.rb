class Group < ApplicationRecord
  has_many :engagements
  has_many :users, through: :engagements
  has_many :organizers, -> { where("engagements.role": :organizer) }, through: :engagements,  source: :user
  validates :name, :presence => true
  validates_uniqueness_of :name

  def self.search(query)
    query = query.downcase
    where(["LOWER(name) LIKE ?", "%#{query}%"])
  end
end
