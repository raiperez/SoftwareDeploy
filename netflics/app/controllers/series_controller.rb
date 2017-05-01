class SeriesController < ApplicationController
  before_action :set_series, only: [:show, :edit, :update, :destroy]

  def index
    @series = Series.all
  end

  def show_all
    @series = Series.all
  end

  def show
  end

  def new
    @genres = Series.genres
    @countries = Series.countries
    @languages = Series.languages
    @series = Series.new
    @new = true
  end

  def edit
    @genres = Series.genres
    @countries = Series.countries
    @languages = Series.languages
  end

  def create
    series = Series.new(update_params)
    if series.save
      @series = Series.all
      render "show_all"
    else
      @genres = Series.genres
      @countries = Series.countries
      @languages = Series.languages
      @new = true
      @series = series
      render 'new'
    end
  end

  def update
    series = Series.find(params[:id])
    series.update_attribute(:name, update_params[:name])
    series.update_attribute(:genre, update_params[:genre])
    series.update_attribute(:country, update_params[:country])
    series.update_attribute(:language, update_params[:language])
    series.update_attribute(:summary, update_params[:summary])
    if series.save
      @series = Series.all
      render "show_all"
    else
      @genres = Series.genre
      @countries = Series.country
      @languages = Series.language
      @series = series
      render 'edit'
    end
  end

  def destroy
    seasons = @series.season
    seasons.each do |season|
      season.episode.each(&:destroy)
    end
    seasons.each(&:destroy)
    @series.destroy
    @series = Series.all
    render "show_all"
  end

  private
    def set_series
      @series = Series.find(params[:id])
    end

    def update_params
      params.require(:series).permit(:name, :genre, :country, :language, :summary)
    end
end
