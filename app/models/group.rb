class Group < ApplicationRecord
  has_many :engagements
  has_many :users, through: :engagements
  has_many :organizers, -> { where("engagements.role": 0) }, through: :engagements,  source: :user
  validates :name, :presence => true

  def self.search(query)
    query = query.downcase
    where(["LOWER(name) LIKE ?", "%#{query}%"])
  end

  def self.import(file)
#    CSV.parse(File.read(file), headers: true)
    #raise "Unknown file type: #{file.original_filename}"
  end
end
