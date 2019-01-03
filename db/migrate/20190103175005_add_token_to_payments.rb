class AddTokenToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :stripe_token, :string
    add_column :payments, :stripe_charge_id, :string
  end
end
