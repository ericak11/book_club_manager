# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  first_name         :string
#  last_name          :string
#  email              :string
#  phone_number       :string
#  encrypted_password :string(128)      not null
#  confirmation_token :string(128)
#  remember_token     :string(128)      not null
#  created_at         :datetime
#  updated_at         :datetime
#  admin              :boolean
#  member             :boolean
#

class UsersController < Clearance::UsersController
  before_action :is_admin, only: [:index, :show, :update, :destroy]
  before_action :set_user, only: [:edit, :update, :destroy]
  def index
    @users = User.all
  end
  def create
    @user = user_from_params
    if params[:user][:password] != params[:user][:password_confirmation]
      @user.errors.add(:password, 'Password & Password Confirmation must match')
      render template: "users/new"
    elsif @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end
  def edit
  end
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    respond_to do |format|
      if @user.destroy
        format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
        format.json { render :index, status: :ok}
      else
        format.html { render :index}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def user_params
    params[:user].permit(:email, :password, :first_name, :last_name, :admin, :member)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
