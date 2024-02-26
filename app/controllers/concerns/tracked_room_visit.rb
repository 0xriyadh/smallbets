module TrackedRoomVisit
  extend ActiveSupport::Concern

  included do
    helper_method :last_room_visited
    helper_method :landing_room
  end

  def remember_last_room_visited
    cookies[:last_room] = @room.id
  end
  
  def landing_room
    original_open_room = Room.opens.order(:created_at).first
    Current.user.member_of?(original_open_room) ? original_open_room : Current.user.memberships.visible.without_directs.with_ordered_room.first 
  end

  def last_room_visited
    Current.user.rooms.find_by(id: cookies[:last_room]) || default_room
  end

  private
    def default_room
      Current.user.rooms.original
    end
end
