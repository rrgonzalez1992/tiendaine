class CartController < ApplicationController
  before_filter :initialize_cart

  def add
    @item = Item.find params[:id]
    @page_title = 'Añadir articulo'
    if request.post?
      @_item = @cart.add params[:id]
      flash[:cart_notice] = "Añadido <em>#{@_item.item.name}</em>."
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'add', :template => 'cart/add'
    end
  end

  def remove
    @item = Item.find params[:id]
    @page_title = 'Eliminar artículo'
    if request.post?
      @_item = @cart.remove params[:id]
      flash[:cart_notice] = "Eliminado 1 <em>#{@_item.item.name}</em>."
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'remove'
    end
  end

  def clear
    @page_title = 'Vaciar carrito'
    if request.post?
      @cart.cart_items.destroy_all
      flash[:cart_notice] = "Cleared cart."
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'clear'
    end
  end
end
