module Trask
  class HtmlPlacement < ActiveRecord::Base

  # different has_one syntax rails 3 -> rails 4... can remove and go
  # with declarations with the lambda once everything's on rails 4
  begin
    has_one :published_revision,
      lambda { where(:is_published => true) },
      :class_name => "HtmlRevision",
      :primary_key => :key,
      :foreign_key => :key
    has_one :latest_revision,
      lambda { where(:is_latest => true) },
      :class_name => "HtmlRevision",
      :primary_key => :key,
      :foreign_key => :key
  rescue
    has_one :published_revision,
      :conditions => { :is_published => true },
      :class_name => "HtmlRevision",
      :primary_key => :key,
      :foreign_key => :key
    has_one :latest_revision,
      :conditions => { :is_latest => true },
      :class_name => "HtmlRevision",
      :primary_key => :key,
      :foreign_key => :key
  end

  validates :key, :uniqueness => { :scope => :page_id }

  end
end
