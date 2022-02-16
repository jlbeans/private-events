class ChangeDateFormatInEvents < ActiveRecord::Migration[6.1]
  def up
    change_column :events, :time, :datetime
  end

  def down
    change_column :events, :time, :date
end
end
