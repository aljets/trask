module Trask
  class HtmlRevision < ActiveRecord::Base

    before_validation :set_latest_revision, :on => :create

    validates :is_latest, :uniqueness => { :scope => :key }, :if => "is_latest == true"
    validates :is_published, :uniqueness => { :scope => :key }, :if => "is_published == true"

    def publish!
      begin
        HtmlRevision.transaction do
          published_revision = HtmlRevision.where(:key => key, :is_published => true).first
          published_revision.update_attributes!(:is_published => false) if published_revision

          self.touch(:published_at)
          self.is_published = true
          self.save!
        end

      rescue ActiveRecord::StatementInvalid, ActiveRecord::RecordInvalid => e
        logger.error("Publish transaction not completed. ActiveRecord exception: #{e.message}")
      end
    end

    private

      def set_latest_revision
        latest_revision = HtmlRevision.where(:key => key, :is_latest => true).first
        latest_revision.update_attribute(:is_latest, false) if latest_revision
      end


  end
end
