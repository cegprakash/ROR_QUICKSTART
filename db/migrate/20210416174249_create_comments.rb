class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :from_user
      t.references :to_user
      t.string :comment
      t.timestamps
    end
    # add_foreign_key :comments, :users , column: :from_user_id
    # add_foreign_key :comments, :users , column: :to_user_id
  end
end
