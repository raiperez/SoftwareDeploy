class StaticPagesController < ApplicationController
  def new
  end
  def home
  	@user = current_user
  end
end
