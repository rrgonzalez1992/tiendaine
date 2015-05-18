class Admin::ItemController < ApplicationController
  def new
   load_data
   @item = Item.new
   @page_title = 'Dar de alta nuevo componente'
  end

  def create
     @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "EL artículo #{@item.name} ha sido creado con éxito."
      redirect_to :action => 'index'
    else
      load_data
      @page_title = 'Crear nuevo articulo'
      render :action => 'new'
    end
  end

  def edit
    load_data
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

  def index
    sort_by = params[:sort_by]
    @items = Item.order(sort_by).paginate(:page => params[:page], :per_page => 5)
    @page_title = 'Listado de componentes'
  end
  private
  def load_data
    @manufacturers = Manufacturer.all
    @providers = Provider.all
  end
    def item_params
      params.require(:item).permit(:name, :description, :price, :weight, :dimensions, :manufacturer_id, { :provider_ids => [] }, :number_cores, :core_frequency, :socket, :TDP, :watts, :cover_image)
    end

end
