class InvoicesController < ApplicationController

  def index
    @invoices_info = Invoice.all
  end

  def show
    @invoice_info = Invoice.find(params[:id])
  end

  def new
    @invoice_info = Invoice.new
  end

  def edit
    @invoice_info = Invoice.find(params[:id])
  end

  def create
    @invoice_info = Invoice.new(invoice_params)
    if(@invoice_info.save)
      redirect_to @invoice_info
    else
      render 'new'
    end
  end

  # def update
  #   @invoice_info = Invoice.find(params[:id])
  #   if @invoice_info.update(invoice_params)
  #     redirect_to @invoice_info
  #   else
  #     render 'edit'
  #   end
  # end

  private
    def invoice_params
      params.require(:invoice_info).permit(:invoiceTitle, :invoiceNumber, :applicatName)
    end
end
