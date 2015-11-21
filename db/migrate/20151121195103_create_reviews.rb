class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :uid
      t.integer :score

      t.timestamps null: false
    end
  end
end
