require "test_helper"

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #
  test "unsuccessful destroy" do
    get invoices_path(@invoice_info)
    assert_template 'inovices/show'
    delete invoices_path(@invoice_info), params: { invoice: { id: "1", InvoiceTitle: "test" } }

    assert_template 'inovices/destroy'
  end
end
