class SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :edit, :update, :destroy]

  # GET /seasons
  # GET /seasons.json
  def index
    @seasons = Season.all
  end

  def show_all
    @series = Series.find_by_id(params[:series])
  end

  # GET /seasons/1
  # GET /seasons/1.json
  def show
  end

  # GET /seasons/new
  def new
    series = Series.find_by_id(params[:series])
    @season = Season.new
    @new = true
    @season.series = series
  end

  def edit
  end

  # POST /seasons
  # POST /seasons.json
  def create
    season = Season.new(season_params)
    season.update_attribute(:series_id, params[:series_id])
    if season.save
      @series = season.series
      render "show_all"
    else
      @new = true
      @season = season
      render 'new'
    end
  end

  def update
    season = Season.find(params[:id])
    season.update_attribute(:number, update_params[:number])
    season.update_attribute(:year, update_params[:year])
    season.update_attribute(:summary, update_params[:summary])
    if season.save
      @series = season.series
      render "show_all"
    else
      @season = season
      render 'edit'
    end
  end

  def destroy
    episodes = @season.episode
    episodes.each(&:destroy)
    @series = @season.series
    @season.destroy
    render "show_all"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season
      @season = Season.find(params[:id])
    end

    def update_params
      params.require(:season).permit(:number, :year, :summary)
    end

    def season_params
      params.require(:season).permit(:number, :year, :summary)
    end
end
