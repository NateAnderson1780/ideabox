class Idea < ApplicationRecord
  belongs_to :category 
  belongs_to :user 
  has_many :images, through: :idea_images
  
  validates :subject, presence: true
  validates :description, presence: true
  
end