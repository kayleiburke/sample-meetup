class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :engagements
  has_many :groups, through: :engagements

  def full_name
    [self.first_name, self.last_name].join(" ")
  end
end
