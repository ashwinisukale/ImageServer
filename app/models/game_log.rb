class GameLog < ApplicationRecord
  belongs_to :image

  def ist(time)
    time.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata')).strftime("%d-%m-%Y %r")
  end

  def capture_time
    ist created_at
  end
end
