module BoardHelper
  def broadcast_rooms
    [
      'all',
      params[:board_id]
    ]
  end
end
