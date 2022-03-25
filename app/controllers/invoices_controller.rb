class InvoicesController < ApplicationController

  http_basic_authenticate_with name: "admin" , password: "123456"
  @@lock = Mutex.new

  def index
    @invoices_info = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if(@invoice.save)
      redirect_to @invoice
    else
      render 'new'
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    @@lock.synchronize do
      #考虑并发问题
      if @invoice.update(invoice_params)
        redirect_to @invoice
      else
        render 'edit'
      end
    end
  rescue StandardError => e
    #判断是否是唯一键，如果是唯一键对前端做提醒
    puts "error is #{e.inspect}"
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to invoices_path
  end
  def deleteInvoice(id)
    @invoice = Invoice.find(id)
    @invoice.destroy
    redirect_to invoices_path
  end

  private
    def invoice_params
      params.require(:invoice).permit(:invoice_title, :invoice_number, :applicat_name)
    end
end
