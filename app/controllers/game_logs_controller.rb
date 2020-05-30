class GameLogsController < ApplicationController
  before_action :set_game_log, only: [:show, :update, :destroy]

  # GET /game_logs
  # GET /game_logs.json
  def index
    @game_logs = GameLog.all
  end

  # GET /game_logs/1
  # GET /game_logs/1.json
  def show
  end

  # POST /game_logs
  # POST /game_logs.json
  def create
    @game_log = GameLog.new(game_log_params)

    if @game_log.save
      render :show, status: :created, location: @game_log
    else
      render json: @game_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /game_logs/1
  # PATCH/PUT /game_logs/1.json
  def update
    if @game_log.update(game_log_params)
      render :show, status: :ok, location: @game_log
    else
      render json: @game_log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /game_logs/1
  # DELETE /game_logs/1.json
  def destroy
    @game_log.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_log
      @game_log = GameLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_log_params
      params.require(:game_log).permit(:image_id, :capture_time)
    end
end
