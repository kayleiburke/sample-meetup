class User < ApplicationRecord
  has_many :engagements
  has_many :groups, through: :engagements
end
