class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.integer :tenant_id

      t.timestamps
    end
  end
end
