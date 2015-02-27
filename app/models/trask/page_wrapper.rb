module Trask
  class PageWrapper

    attr_accessor :key, :html_placements

    class << self
    end

    # Can define own Page Wrapper to call another service, ORM, etc.
    #
    # On initialization, can eager load all html placements, or should create a page if does not exist
    #
    # Should return:
    #   html_placements: a hash with the placement key as the key and content and published_at as keys for the record
    #   key: the page key
    def initialize(key: key, revision: revision, items: items)
      @page = Trask::Page.where(key: key).includes(html_placements: revision).first || Trask::Page.create(key: key)
      @key = @page.key
      build_html_placements
      self
    end

    def create_html_placement(placement_key)
      @page.html_placements.create(key: placement_key)
    end

    private

    def build_html_placements
      result = {}
      @page.html_placements.each do |placement|
        if placement.latest_revision
          result[placement.key] = {}
          result[placement.key][:content] = placement.latest_revision.content
          result[placement.key][:published_at] = placement.latest_revision.published_at
        end
      end
      self.html_placements = result
    end

  end
end
