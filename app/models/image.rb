class Image < ApplicationRecord
  has_many :ideas, through: :idea_images 
  
  validates :url, presence: true 
end