class Idea < ApplicationRecord
  belongs_to :category 
  belongs_to :user 
  has_many :images, through: :image_ideas
  
  validates :subject, presence: true
  validates :description, presence: true
  
end