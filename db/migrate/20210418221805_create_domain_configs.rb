class CreateDomainConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :domain_configs do |t|
      t.string :domain
      t.integer :tenant_id

      t.timestamps
    end
  end
end
