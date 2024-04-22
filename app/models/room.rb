class Room < ApplicationRecord
  has_one_attached :image
  has_one_attached :images
  belongs_to :user
  has_many :reservations
  validates :price, numericality: { greater_than_or_equal_to: 1}

  def image_content_type
    if image.attached? && !image.content_type.in?(%w[image/jpeg image/png image/gif])
      errors.add(:image, '：ファイル形式が、JPEG, PNG, GIF以外になってます。ファイル形式をご確認ください。')
    end
  end

  def image_size
    if image.attached? && image.blob.byte_size > 1.megabytes
      errors.add(:image, '：1MB以下のファイルをアップロードしてください。')
    end
  end
end
