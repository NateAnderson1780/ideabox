class Image < ApplicationRecord
  has_many :ideas, through: :image_ideas 
  
  validates :url, presence: true 
  validates :name, presence: true
end