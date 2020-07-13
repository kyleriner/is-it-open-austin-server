class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :place_ref
      t.boolean :favorited, :default => false
      t.integer :user_id
    end
  end
end
