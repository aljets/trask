require 'trask/models/editable_html'

module Trask
  module ViewHelpers
    
    def editable_collection(*args, &block)
    end

    def editable_content(*args, &block)
      block = capture(&block) if block_given?
      content = Trask::EditableHtml.build(@_editable_page, edit_mode?, block, *args)
      if content.html
        content_tag content.tag, content.html, content.attrs
      end
    end

    private

  end
end
