class CreateTraskHtmlPlacements < ActiveRecord::Migration
  def change
    create_table :trask_html_placements do |t|
      t.integer :page_id
      t.string :key, limit: 1.kilobyte
    end
  end
end
