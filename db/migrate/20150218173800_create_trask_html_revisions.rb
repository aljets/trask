class CreateTraskHtmlRevisions < ActiveRecord::Migration
  def change
    create_table :trask_html_revisions do |t|
      t.string :key, limit: 1.kilobyte
      t.text :content, limit: 1.megabyte
      t.string :comments, limit: 10.kilobytes
      t.integer :author_id
      t.datetime :created_at
      t.datetime :published_at
      t.datetime :is_published, default: false
      t.datetime :is_latest, default: true
    end
  end
end
