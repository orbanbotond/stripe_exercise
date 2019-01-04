class AddRefundIdToPayment < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :refund_id, :string
  end
end
