require 'trask/models/editable_html'

module Trask
  module ViewHelpers
    
    def editable_collection(*args, &block)
    end

    def editable_content(*args, &block)
      content = Trask::EditableHtml.build(@_editable_page, edit_mode?, *args, &block)
      if content.html
        content_tag content.tag, content.html, content.attrs
      end
    end

    private

  end
end
