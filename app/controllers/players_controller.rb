class PlayersController < ApplicationController

def index
  p = Player.all 
  render json: p.as_json
end


def show
  @player = current_user
  render template: "users/show"
end


def create
  player = Player.new(
    name: params[:name],
    points: params[:points],
  )
  if player.save
    render json: { message: "Player created successfully" }, status: :created
  else
    render json: { errors: player.errors.full_messages }, status: :bad_request
  end
end


def update
  player = Player.find_by(id: params[:id])
  player.name = params[:name] || player.name
  player.points = params[:points] || player.points

  player.save

  render json: player.as_json
end




def destroy
  player = Player.find_by(id: params[:id])

  player.destroy
  render json: player.as_json
end

  
end
