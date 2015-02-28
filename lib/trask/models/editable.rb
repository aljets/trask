module Trask
  class Editable

    class << self
      def build(*args, &block)
        item = self.new(*args, &block)
        item.map! if !item.is_mapped?
        item.show
      end
    end

    def build_key(item_label, page, shared=false)
      if ( item_label =~ /\|/ )
        raise NameError, "Must not have pipes ('|') in item label"
      end

      if shared
        [shared, item_label].join("|")
      else
        [page.key, item_label].join("|")
      end
    end

  end
end
