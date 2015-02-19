module Trask
  module ControllerHelpers

    def self.included(klass)
      klass.class_eval do

        helper_method :edit_mode?

        def edit_mode?
          # Must be implemented within application
          raise NotImplemented
        end

        def require_edit_mode
          raise InsufficientPermissions unless edit_mode?
        end

        # Use as a before filter on action, e.g. before_filter :editable_page, only: [:index]
        # Will grab all revisions for a page; creates if it does not yet exist
        def editable_page(request_path_override=nil)
          page_key = request_path_override || request.path

          revision, items = if edit_mode? || params[:preview] = "true"
            [:latest_revision, :latest_items]
          else
            [:published_revision, :published_items]
          end

          @_editable_page = Trask::PageWrapper.new(key: page_key, revision: revision, items: items)
        end

      end
    end

    class InsufficientPermissions < StandardError; end
    class NotImplemented < StandardError; end
  end
end
