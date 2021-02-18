class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers, :likes, :edit, :update]
  #before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(id: :desc).search(params[:search]).page(params[:page])
    counts(@user)
    @comment = current_user.comments.build
    #@comments = @user.comments.order(id: :desc).page(params[:page]) #←comments表示用
    #@comment.micropost_id = params[:micropost_id]　←いる？？(render時にパーシャル呼び出しているので不要)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end

  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.order(id: :desc).page(params[:page])
    counts(@user)
    @comment = current_user.comments.build
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
        flash[:success] = 'Message は正常に更新されました'
        redirect_to user_path
      # 更新に成功したときの処理
    else
      render 'edit'
    end
  end
  
  def reactions
    @user = User.find(params[:id])
    @reactions = @user.reactions.order(id: :desc).page(params[:page]).per(25)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
  
end
