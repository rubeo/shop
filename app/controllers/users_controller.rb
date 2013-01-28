class UsersController < ApplicationController
  respond_to :html, :json

  def index
    @users = User.page params[:page]
    @page_info = {
      current_page: @users.current_page,
      num_pages:    @users.num_pages,
      per_page:     @users.limit_value,
    }

    respond_to do |format|
      format.html
      format.json do
        respond_with({ models: @users }.merge @page_info)
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

  def filter
    unless params[:field] == "all_columns"
      fields = params[:field] 
    else
      fields = %w(login_name first_name lastName role)
    end
    users = case params[:method]
             when "start_with" then User.start_with(fields, params[:query])
             when "equals" then User.equals(fields, params[:query])
             when "not_equal_to" then User.not_equal_to(fields, params[:query])
             when "contains" then User.contains(fields, params[:query])
             else User.does_not_contain(fields, params[:query]) 
             end

    respond_with users

  end


end
