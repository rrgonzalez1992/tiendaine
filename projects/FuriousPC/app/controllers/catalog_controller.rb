class CatalogController < ApplicationController
before_filter :require_no_user
before_filter :initialize_cart
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

def search
@page_title = "Search"
if params[:commit] == "Search" || params[:q]
@items = Item.find_with_ferret(params[:q])
unless @items.size > 0
flash.now[:notice] = "No hemos encontrado productos con tus criterios"
end
end
end

def rss
latest
request.format = "xml" 
respond_to do |format|
  format.xml {render :layout => false} 
end
end

end

