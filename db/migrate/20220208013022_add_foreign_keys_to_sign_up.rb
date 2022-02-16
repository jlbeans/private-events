class AddForeignKeysToSignUp < ActiveRecord::Migration[6.1]
  def change
    add_reference :sign_ups, :attendee, foreign_key: {to_table: :users}
    add_reference :sign_ups, :attended_event, foreign_key: {to_table: :events}
  end
end
