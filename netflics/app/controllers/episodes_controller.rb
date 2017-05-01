class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]

  def show
  end

  def show_all
    @season = Season.find_by_id(params[:season])
  end

  def new
    season = Season.find_by_id(params[:season])
    @new = true
    @episode = Episode.new
    @episode.season = season
  end

  def edit
  end

  def create
    episode = Episode.new(update_params)
    episode.update_attribute(:season_id, params[:season_id])
    if episode.save
      @season = episode.season
      render "show_all"
    else
      @new = true
      @episode = episode
      render 'new'
    end
  end

   def update
    episode = Episode.find(params[:id])
    episode.update_attribute(:name, update_params[:name])
    episode.update_attribute(:number, update_params[:number])
    episode.update_attribute(:length, update_params[:length])
    episode.update_attribute(:summary, update_params[:summary])
    if episode.save
      @season = episode.season
      render "show_all"
    else
      @episode = episode
      render 'edit'
    end
  end

  def destroy
    @season = @episode.season
    @episode.destroy
    render "show_all"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params[:id])
    end

    def update_params
      params.require(:episode).permit(:name, :number, :length, :summary)
    end
end
