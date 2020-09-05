class User < ApplicationRecord
  has_many :engagements
  has_many :groups, through: :engagements

  def full_name
    [self.first_name, self.last_name].join(" ")
  end
end
