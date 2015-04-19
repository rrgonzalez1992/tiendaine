class Admin::ItemController < ApplicationController
  def new
    load_data
   @item = Item.new
   @page_title = 'Dar de alta nuevo componente'
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
      redirect_to :action => 'show', :id => @item
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

  def choosetype
    @item = Item.new
    load_data
    @type = params[:itemtype]
  end
  def index
     @items = Item.all
    @page_title = 'Listado de componentes'
  end
  private
  def load_data
    @manufacturers = Manufacturer.all
  end
    def item_params
      params.require(:item).permit(:name, :description, :imagepath, :price, :weight, :dimensions, :id_manufacturer)
    end

end
