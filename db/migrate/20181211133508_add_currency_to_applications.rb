class AddCurrencyToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :currency, :string
  end
end
