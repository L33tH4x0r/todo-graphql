class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :description, required: true
      t.integer :count
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :completed, required: true, default: false
      t.string :type, default: 'TextTask'
      t.belongs_to :list, required: true

      t.timestamps
    end
  end
end
