require 'trask/models/editable'

module Trask
  class EditableCollection < Editable

    attr_reader :tag, :html, :attrs

    def initialize(page, edit_mode, block, item_label, shared: false, css_class: '', tag: 'div')
      raise NotImplementedError, "Must declare 'editable_page' in before_filter" if !page
      @page = page
      @item_label = item_label
      @shared = shared
      @css_class = css_class
      @tag = tag
      @block = block
    end

    def map!
      @page.create_collection_placement(key)
    end

    def is_mapped?
      !!@page.collection_placements[key]
    end

    def show
      items = @page.collection_placements[key]

      container_attrs = {:class => options[:collection_class]}

      item_attrs = {:class => options[:item_class]}

      self
    end

  end
end
