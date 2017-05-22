class ChancePriceLocation < ActiveRecord::Migration[5.1]
  def change
    remove_column(:shoes, :price)
    add_column(:brands, :price, :integer)
  end
end
