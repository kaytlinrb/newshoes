class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |s|
      s.column(:name, :string)
  end
    create_table(:shoes) do |s|
      s.column(:price, :integer)
  end
    create_table(:brands) do |s|
      s.column(:name, :string)
    end
  end
end
