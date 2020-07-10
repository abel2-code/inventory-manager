class AddDateOfExchangeColumnToProductExchange < ActiveRecord::Migration[6.0]
  def change
    add_column :product_exchanges, :date_of_exchange, :datetime
  end
end
