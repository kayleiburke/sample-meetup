class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :engagements, :dependent => :destroy
  has_many :groups, through: :engagements
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true

  def full_name
    [self.first_name, self.last_name].join(" ")
  end
end
