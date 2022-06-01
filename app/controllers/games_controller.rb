class API::GamesController < ApplicationController


  def create
    render json: {id: new_game.id}, status: 201
  end

  def show
    game_hash = {
      score: game.score,
      score_by_frame: game.frames,
      game_over: game.game_over?,
    }
    render json: game_hash, status: 200
  end

  def update
    if game
      game.throw! knocked_pins: update_params[:knocked_pins].to_i
      render json: {}, status: 204
    else
      render json: {message: "Game not found."}, status: 404
    end

  rescue GameError, AvailablePinsError => e
    render json: {message: e.message}, status: 422
  end

private

  def new_game
    @new_game ||= Game.create
  end

  def game
    @game ||= Game.cached_find_by_id(params[:id])
  end

  def update_params
    raise(ActionController::ParameterMissing, "Wrong knocked pins data format.") if params[:knocked_pins].to_s.chars.any? {|c| c=~/[^\d]/}
    params.require(:knocked_pins)
    params.permit(:knocked_pins)
  end


























  # person1_rolls = []
  # person2_rolls = []
  # all_scores = [person1_rolls, person2_rolls]
  
  # 10.times do 
  #   all_scores.each do |person_score|     
  #     2.times do
  #       person_score << rand(1..10)      
  #     end
  #   end
  # end
  
  # p all_scores[0].sum
  # p all_scores[1].sum
  
  # if all_scores[0].sum > all_scores[1].sum
  #   p "person1 wins"
  # elsif all_scores[0].sum < all_scores[1].sum
  #   p "person2 wins"
  # else
  #   p "it is a tie? can you have a tie in bowling? does it go into overtime?"
  # end



end
