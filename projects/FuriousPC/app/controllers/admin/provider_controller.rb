class Admin::ProviderController < ApplicationController
  def new
    @provider = Provider.new
    @page_title = 'Dar de alta a nuevo proveedor'
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      flash[:notice] = "Proveedor #{@provider.name} dado de alta"
      redirect_to :action => 'index'
    else
      @page_title = 'Dar de alta a nuevo proveedor'
      render :action => 'new'
    end
  end

  def edit
    @provider = Provider.find(params[:id])
    @page_title = 'Editar un proveedor'
  end

  def update
    @provider = Provider.find(params[:id])
    if @provider.update_attributes(provider_params)
      flash[:notice] = "El proveedor #{@provider.name} ha sido actualizado"
      redirect_to :action => 'show', :id =>@provider
    else
      @page_title = 'Editar un proveedor'
      render :action => 'edit'
    end
  end

  def index
    @providers = Provider.all
    @page_title = 'Listado de proveedores'
  end

  def show
    @provider = Provider.find(params[:id])
    @page_title = @provider.name
  end

  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy
    flash[:notice] = "El proveedor #{@provider.name} ha sido dado de baja"
    redirect_to :action => 'index'    
  end
  private

    def provider_params
      params.require(:provider).permit(:name, :tlf, :phone, :direction)
    end
end
