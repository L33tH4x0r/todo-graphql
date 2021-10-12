class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :title, required: true
      t.belongs_to :user, required: true

      t.timestamps
    end
  end
end
