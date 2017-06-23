class HomeController < ApplicationController
  def index
    if current_player
      redirect_to hunts_path
    else
      redirect_to new_player_session_path
    end
  end
end