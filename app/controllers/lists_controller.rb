class ListsController < ApplicationController
  respond_to :json

  def home

  end

  def index
    @lists = user.lists.all
    
    respond_with(@lists) do |format|
      format.json {render json: @lists.as_json(:include => :tasks) }
    end
  end

  def show
    @list = user.lists.find(params[:id])

    respond_with(@list) do |format|
      format.json {render json: @list.as_json(:include => :tasks)}
    end
  end

  def create
    @list = user.lists.create!(list_params)

    respond_with(@list) do |format|
      format.json {render json: @list.as_json }
    end    
  end

  def destroy
    @list = user.lists.find(params[:id])

    @list.destroy

    respond_with(@list) do |format|
      format.json {render json: @list.as_json }
    end
  end

  def update
  end

  private

  def user
    User.find(current_user.id)
  end

  def list_params
    params.require(:list).permit(:title, :details, :id)
  end
end
