class CreateShortUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :short_urls do |t|
      t.string :url
      t.string :short_url
      t.string :string

      t.timestamps
    end
  end
end
