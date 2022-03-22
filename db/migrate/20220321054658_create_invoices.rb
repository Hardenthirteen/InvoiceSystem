class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :invoiceTitle
      t.string :invoiceNumber
      t.string :applicatName

      t.timestamps
    end
  end
end
