class AddRawdataToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :rawdata, :string
  end
end
