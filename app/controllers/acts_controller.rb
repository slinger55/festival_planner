class ActsController < ApplicationController
  before_filter :authenticate
  def edit
    @act = Act.find(params[:id])
  end
  def update
    @act = Act.find(params[:id])
    if @act.update(act_params)
      redirect_to root_path, notice: 'Act was successfully updated.'
    else
      redirect_to root_path, notice: 'Act was not successfully updated. :('
    end
  end
  def create
    @act = Act.new(act_params)
    if @act.save
      redirect_to root_path, notice: 'Act was successfully created.'
    else
      render action: 'index'
    end
  end
  def destroy
    @act = Act.find(params[:id])
    @act.destroy
    redirect_to root_path, notice: 'Act was successfully destroyed.'
  end
  def index
    @act = Act.new
  end
  private
    def act_params
      params[:act].permit!
    end
  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "password"
    end
  end
end
