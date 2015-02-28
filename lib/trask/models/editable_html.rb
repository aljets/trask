require 'trask/models/editable'

module Trask
  class EditableHtml < Editable

    attr_reader :tag, :css_class, :key
    attr_accessor :html

    def initialize(page, block, item_label, shared: false, css_class: '', tag: 'div')
      raise NotImplementedError, "Must declare 'editable_page' in before_filter" if !page
      @page = page
      @key = build_key(item_label, page, shared)
      @css_class = css_class
      @tag = tag
      @block = block
    end

    def map!
      @page.create_html_placement(@key)
    end

    def is_mapped?
      !!@page.html_placements[@key]
    end

    def is_published?
      @page.html_placements[@key] && !!@page.html_placements[@key][:published_at]
    end

    def show
      revision = @page.html_placements[@key]

      @html = if revision && !revision[:content].blank?
        revision[:content].html_safe
      elsif !revision && @block && !@block.blank?
        @block
      end

      self
    end

  end
end
