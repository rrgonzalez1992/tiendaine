class Admin::ItemController < ApplicationController
  def new
   @item = Item.new
   @page_title = 'Crear nuevo fabricante'
  end

  def create
     @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Articulo #{@item.name} was successfully created."
      redirect_to :action => 'index'
    else
      @page_title = 'Crear nuevo articulo'
      render :action => 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
      @page_title = 'Editar articulo'
  end

  def update
     @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:notice] = "El articulo #{@item.name} ha sido actualizado."
      redirect_to :action => 'show', :id => @manufacturer
    else
      @page_title = 'Editar articulo'
      render :action => 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Se ha borrado el articulo #{@item.name}."
    redirect_to :action => 'index'
  end

  def show
    @item = Item.find(params[:id])
    @page_title = @item.name 
  end

  def index
     @items = Item.all
    @page_title = 'Listado de fabricante'
  private
    def manufacturer_params
      params.require(:item).permit(:name, :description, :imagepath, :price, :weight, :dimensions, :id_manufacturer)
    end

end
