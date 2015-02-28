require 'trask/models/editable_html'

module Trask
  module ViewHelpers
    
    def editable_collection(*args, &block)
      block = capture(&block) if block_given?
      collection = Trask::ContentCollection.build(@_editable_page, block, *args)
      render partial: 'content_collection', locals: { collection: collection }
    end

    def editable_html(*args, &block)
      block = capture(&block) if block_given?
      content = Trask::EditableHtml.build(@_editable_page, block, *args)
      render partial: 'trask/editable_html', locals: { content: content }
    end

  end
end
