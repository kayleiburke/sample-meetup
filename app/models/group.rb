class Group < ApplicationRecord
  has_many :engagements
  has_many :users, through: :engagements

  def self.search(query)
    where(["name LIKE ?", "%#{query}%"])
  end
end
