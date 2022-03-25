class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :invoice_title
      t.string :invoice_number
      t.string :applicat_name
      t.timestamps
    end
    add_index :invoice_number, nul: false, unique: true
  end
end
