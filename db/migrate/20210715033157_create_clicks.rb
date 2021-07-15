class CreateClicks < ActiveRecord::Migration[6.1]
  def change
    create_table :clicks do |t|
      t.references :short_url, null: false, foreign_key: true
      t.string :ip

      t.timestamps
    end
  end
end
