class Meeting < ApplicationRecord
  belongs_to :project
  validates :name, presence: true
  after_create :generate_zoom_link

  private

  def generate_zoom_link
    return if meeting_link.present?

    response = Zoom.new.meeting_create(
      topic: name,
      user_id: ENV['ZOOM_USER_ID'],
      duration: 120,
      settings: {
        join_before_host: true,
        host_video: true,
        participant_video: true,
        mute_upon_entry: true,
        waiting_room: false
      }
    )

    update(meeting_link: response['join_url'])
  end
end
