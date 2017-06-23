class HuntsController < ApplicationController
  before_action :authenticate_player!

  def index
    @new_hunt = Hunt.new
    @hunt = current_player.party.hunts.includes(:battle_rounds => :battle_actions).last
  end

  def create
    @hunt = current_player.party.hunts.build(hunt_type: params[:hunt][:hunt_type])
    @hunt.process!
    redirect_to hunts_path
  end
end