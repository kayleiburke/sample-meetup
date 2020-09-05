class Group < ApplicationRecord
  has_many :engagements
  has_many :users, through: :engagements

  def self.search(query)
    query = query.downcase
    where(["LOWER(name) LIKE ?", "%#{query}%"])
  end
end
