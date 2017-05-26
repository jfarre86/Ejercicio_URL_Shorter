class AddVisitsCountToShortUrls < ActiveRecord::Migration[5.1]
  def change
    add_column :short_urls, :visits_counter, :integer, default: 0
  end
end
