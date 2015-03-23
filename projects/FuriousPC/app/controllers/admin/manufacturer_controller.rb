class Admin::ManufacturerController < ApplicationController
  def new
	@manufacturer = Manufacturer.new
	@page_title = 'Crear nuevo fabricante'
  end

  def create
@manufacturer = Manufacturer.new(manufacturer_params)
if @manufacturer.save
flash[:notice] = "Manufacturer #{@manufacturer.name} was successfully created."
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
 @manufacturer = Manufacturer.find(params[:id])
 @page_title = @manufacturer.name  
end

  def index
 @manufacturers = Manufacturer.find(params[:all])
 @page_title = 'Listing manufacturer'
  end
  private
    def manufacturer_params
      params.require(:manufacturer).permit(:name, :tlf, :phone, :direction)
    end
end
