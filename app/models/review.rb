class Review < ApplicationRecord
  belongs_to :restaurant #done by default with the command thanks to references
  validates :content, presence: true
end
