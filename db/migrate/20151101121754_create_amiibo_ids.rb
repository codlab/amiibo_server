class CreateAmiiboIds < ActiveRecord::Migration
  def change
    create_table :amiibo_ids do |t|
      t.string :name
      t.string :identifier

      t.timestamps
    end
  end
end
