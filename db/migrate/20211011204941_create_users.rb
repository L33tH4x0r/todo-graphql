class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, required: true
      t.string :username, required: true
      t.string :password_digest, required: true

      t.timestamps
    end
  end
end
