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
    if @invoice_info.update(invoice_params)
      redirect_to @invoice_info
    else
      render 'edit'
    end
  end

  def destroy
    @invoice_info = Invoice.find(params[:id])
    puts("asd")
    @invoice_info.destroy
    redirect_to invoices_path
  end
  def deleteInvoice(id)
    @invoice_info = Invoice.find(id)
    puts("asd")
    @invoice_info.destroy
    redirect_to invoices_path
  end

  private
    def invoice_params
      params.require(:invoice_info).permit(:invoiceTitle, :invoiceNumber, :applicatName)
    end
end
