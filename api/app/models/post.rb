class Post < ApplicationRecord
  belongs_to :topic
  
  validates :body, presence: true
end
