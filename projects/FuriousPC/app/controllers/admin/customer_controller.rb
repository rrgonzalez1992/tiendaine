class Admin::CustomerController < ApplicationController
	def new
		@customer = Customer.new
		@page_title = 'Crear nuevo cliente'
	end
	def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = "Cliente #{@customer.first_name} #{@customer.last_name} se creo con exito."
      redirect_to :action => 'index'
    else
      @page_title = 'Crear nuevo cliente'
      render :action => 'new'
    end
  end

  def edit
      @customer = Customer.find(params[:id])
      @page_title = 'Editar cliente'
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      flash[:notice] = "El cliente #{@customer.first_name} #{@customer.last_name} ha sido actualizado."
      redirect_to :action => 'show', :id => @customer
    else
      @page_title = 'Editar cliente'
      render :action => 'edit'
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = "Se ha borrado el cliente #{@customer.first_name} #{@customer.last_name}."
    redirect_to :action => 'index'
  end

  def show
    @customer = Customer.find(params[:id])
    @page_title = @customer.first_name  
  end

  def index
    @customers = Customer.all
    @page_title = 'Lista de clientes'
  end
  private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :identity, :phone, :direction, :postal_code, :city)
    end
end