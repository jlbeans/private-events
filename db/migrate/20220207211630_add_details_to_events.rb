class AddDetailsToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :description, :text
    add_column :events, :location, :string
  end
end
