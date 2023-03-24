class ListsController < ApplicationController

  def index
    @list = List.new
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    list_params
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render 'index', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def list_params
    params.require(:list).permit(:name)
  end

end
