class Category < ApplicationRecord
  has_many :ideas
  
  validates :genre, presence: true

end