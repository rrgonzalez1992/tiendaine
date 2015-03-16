class Admin::ManufacturerController < ApplicationController
  def new
	@manufacturer = Manufacturer.new
	@page_title = 'Crear nuevo fabricante'
  end

  def create
@author = Author.new(params[:author])
if @author.save
flash[:notice] = "Author #{@author.name} was successfully created."
redirect_to :action => 'index'
else
@page_title = 'Create new author'
render :action => 'new'
end
end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def index
  end
end
