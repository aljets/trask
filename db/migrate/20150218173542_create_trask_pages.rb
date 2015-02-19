class CreateTraskPages < ActiveRecord::Migration
  def change
    create_table :trask_pages do |t|
      t.string :key, limit: 1.kilobyte
    end
  end
end
