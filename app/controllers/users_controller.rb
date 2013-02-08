class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def index
    @users = if params[:request]
      fields = if params[:fields] == "all_columns"
        %w(login_name first_name last_name role)
      else
        params[:fields] 
      end
      User.send params[:scope].intern, fields, params[:request]
    else
      User.scoped
    end

    @users = @users.reorder(params[:orderBy]).page(params[:currentPage]).per(params[:perPage])

    @pagination = {
      current_page: @users.current_page,
      num_pages:    @users.num_pages,
      per_page:     @users.limit_value,
      total_count:  User.count,
    }

    
    respond_to do |format|
      format.html
      format.json do
        respond_with({ models: @users }.merge @pagination)
      end
    end
  end

  def show
    @user = User.find params[:id]
    respond_to do |format|
      format.html
      format.json { respond_with @user }
    end
  end

  def create
    @user = User.create params[:user]
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.json { respond_with @user }
    end
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes params[:user]
    respond_to do |format|
      format.html
      format.json { respond_with @user }
    end
  end

  def destroy
    respond_with User.destroy(params[:id])
  end

end
