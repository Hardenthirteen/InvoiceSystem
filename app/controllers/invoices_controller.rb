class InvoicesController < ApplicationController

  http_basic_authenticate_with name: "admin" , password: "123456"
  def index
    @invoices_info = Invoice.all
  end

  def show
    @invoice_info = Invoice.find(params[:id])
  end

  def new
    @invoice_info = Invoice.new
  end

  def create
    #考虑并发问题
    @invoice_info = Invoice.new(invoice_params)
    if(@invoice_info.save)
      redirect_to @invoice_info
    else
      render 'new'
    end
  end

  def edit
    @invoice_info = Invoice.find(params[:id])
  end

  def update
    @invoice_info = Invoice.find(params[:id])
    #考虑并发问题
    if @invoice_info.with_lock.update(invoice_params)
      redirect_to @invoice_info
    else
      render 'edit'
    end
  end

  def destroy
    @invoice_info = Invoice.find(params[:id])
    @invoice_info.destroy
    redirect_to invoices_path
  end
  def deleteInvoice(id)
    @invoice_info = Invoice.find(id)
    @invoice_info.destroy
    redirect_to invoices_path
  end

  private
    def invoice_params
      params.require(:invoice_info).permit(:invoice_title, :invoice_number, :applicat_name)
    end
end
