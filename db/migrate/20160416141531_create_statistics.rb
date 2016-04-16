class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.boolean :input_valid
      t.integer :input_type

      t.timestamps
    end
  end
end
