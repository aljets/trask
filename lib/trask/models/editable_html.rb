require 'trask/models/editable'

module Trask
  class EditableHtml < Editable

    attr_reader :tag, :html, :attrs

    def initialize(page, edit_mode, block, item_label, shared: false, css_class: '', tag: 'div')
      raise NotImplementedError, "Must declare 'editable_page' in before_filter" if !page
      @page = page
      @edit_mode = edit_mode
      @item_label = item_label
      @shared = shared
      @css_class = css_class
      @tag = tag
      @block = block
    end

    def map!
      @page.create_html_placement(key)
    end

    def is_mapped?
      !!@page.html_placements[key]
    end

    def show
      revision = @page.html_placements[key]

      tag_classes = ''

      if revision && !revision[:published_at]
        tag_classes += " unpublished"
      end

      @html = if revision && !revision[:content].blank?
        revision[:content].html_safe
      elsif !revision && @block && !@block.blank?
        @block
      elsif @edit_mode
        tag_classes += " hide-on-preview"
        "[#{@item_label} is empty and will be hidden]"
      end

      attrs = {:class => @css_class}
      if @edit_mode
        attrs[:class] += " editable-content #{tag_classes} default_content"
        attrs[:"data-html-key"] = key
        attrs[:"data-revision-id"] = revision && revision[:id]
        attrs[:"data-shared"] = @shared
        #attrs[:"data-account-id"] = session[:account_access_key][:account_id]
      end

      @attrs = attrs
      self
    end

  end
end
