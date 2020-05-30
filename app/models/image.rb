class Image < ApplicationRecord
  belongs_to :gallery
  has_many :game_logs

  has_attached_file :avatar, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  do_not_validate_attachment_file_type :avatar

  def avatar_url
    avatar.url(:medium)
  end
end
