class Parking < ApplicationRecord
  has_one_attached :parking_image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :spot_name, presence: true
  geocoded_by :address
  after_validation :geocode

  
  def get_parking_image(width, height)
    unless parking_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_parking.png')
      parking_image.attach(io: File.open(file_path), filename: 'no_image_parking.png', content_type: 'image/png')
    end
    parking_image.variant(resize_to_limit: [300, 300]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
