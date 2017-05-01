class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attribute(:first_name, update_params[:first_name])
    @user.update_attribute(:last_name, update_params[:last_name])
    @user.update_attribute(:email, update_params[:email])
    if @user.save
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    puts (params[:id])
    @user = User.find(params[:id])
    if current_user == @user || admin?
      @user.destroy
      redirect_to root_url
    end
  end

  def children
    @user = current_user
  end

  def new_child
    @user = User.new
  end

  # Temporary

  def make_admin
    current_user.role=Role.find_by(title: "Admin")
    current_user.save
    redirect_to current_user
  end

  def not_admin
    current_user.role=nil
    current_user.save
    redirect_to current_user
  end

  # End Temporary

  def create_child
    # METER LOGICA DE CREAR USER Y ASIGNARLE CMO PADRE EL CURRENTUSER
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation)
    end

    def update_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end
