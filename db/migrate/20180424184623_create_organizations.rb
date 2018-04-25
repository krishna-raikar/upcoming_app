class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :org_name, :limit => 50
      t.string :org_identifier, :limit => 50
      t.string :first_name, :limit => 50
      t.string :last_name, :limit => 50
      t.string :addr_line1, :limit => 100
      t.string :addr_line2, :limit => 100
      t.string :city, :limit => 35
      t.string :state, :limit => 50
      t.string :country, :limit => 90
      t.integer :zipcode, :limit => 6
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
