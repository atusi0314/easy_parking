class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :parking
  
  validates :user_id, uniqueness: {scope: :parking_id}
end
