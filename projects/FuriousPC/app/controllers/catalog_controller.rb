class CatalogController < ApplicationController
  def index
  @items = Item.order("items.id desc").includes(:providers, :manufacturer).paginate(:page => params[:page], :per_page => 5)
    @page_title = 'Catálogo'
  end

  def show
    @item = Item.find(params[:id])
    @page_title = @item.name
  end

 def latest
    @items = Item.latest 5
    @page_title = 'Últimos productos'
  end
end
