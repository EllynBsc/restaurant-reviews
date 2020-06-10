class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  #in case you're deleting a restaurant, you should also delete all the reviews that belongs to this resto
end
