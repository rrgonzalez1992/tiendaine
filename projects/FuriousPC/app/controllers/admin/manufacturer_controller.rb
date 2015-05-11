class Admin::ManufacturerController < ApplicationController
  def new
	 @manufacturer = Manufacturer.new
	 @page_title = 'Crear nuevo fabricante'
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:notice] = "El fabricante #{@manufacturer.name} fue creado con éxito."
      redirect_to :action => 'index'
    else
      @page_title = 'Crear nuevo fabricante'
      render :action => 'new'
    end
  end

  def edit
      @manufacturer = Manufacturer.find(params[:id])
      @page_title = 'Editar fabricante.'
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update_attributes(manufacturer_params)
      flash[:notice] = "El fabricante #{@manufacturer.name} ha sido actualizado."
      redirect_to :action => 'show', :id => @manufacturer
    else
      @page_title = 'Editar fabricante'
      render :action => 'edit'
    end
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy
    flash[:notice] = "Se ha borrado el fabricante #{@manufacturer.name}."
    redirect_to :action => 'index'
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @page_title = @manufacturer.name  
  end

  def index
    @manufacturers = Manufacturer.all
    @page_title = 'Listado de fabricantes'
  end
  private
    def manufacturer_params
      params.require(:manufacturer).permit(:name, :tlf, :phone, :direction)
    end
end
