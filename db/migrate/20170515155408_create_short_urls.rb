class CreateShortUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :short_urls do |t|
      t.integer :url_id
      t.string :url

      t.timestamps
    end
  end
end
