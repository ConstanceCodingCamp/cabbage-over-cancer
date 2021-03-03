class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :business_name
      t.string :website
      t.string :social_media
      t.string :email

      t.timestamps
    end
  end
end
