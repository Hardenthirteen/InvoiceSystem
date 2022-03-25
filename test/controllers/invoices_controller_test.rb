require "test_helper"

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #


  test "unsuccessful save" do
    @invoice = Invoice.new
    assert @invoice.save
  end
end
