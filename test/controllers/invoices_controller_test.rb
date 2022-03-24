require "test_helper"

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #


  test "unsuccessful save" do
    @invoice_info = Invoice.new
    assert @invoice_info.save
  end
end
