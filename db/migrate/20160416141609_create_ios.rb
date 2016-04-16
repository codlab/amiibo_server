class CreateIos < ActiveRecord::Migration
  def change
    create_table :ios do |t|
      t.integer :input_type
      t.integer :input_count

      t.timestamps
    end
  end
end
