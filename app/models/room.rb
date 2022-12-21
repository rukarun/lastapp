class Room < ApplicationRecord
  belongs_to :user

  has_one_attached :room_image

  has_many :reservations
end
