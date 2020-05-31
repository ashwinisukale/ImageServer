class GameLog < ApplicationRecord
  belongs_to :image

  def capture_time
    created_at.strftime("%d-%m-%Y %I:%M:%S %p")
  end
end
