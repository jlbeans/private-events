class ChangeTimeColumnEvents < ActiveRecord::Migration[6.1]
  def up
    rename_column :events, :time, :date
  end

end
