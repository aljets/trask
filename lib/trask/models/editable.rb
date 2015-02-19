module Trask
  class Editable

    def key
      if ( @item_label =~ /\|/ )
        raise NameError, "Must not have pipes ('|') in item label"
      end

      if @shared
        [@shared, @item_label].join("|")
      else
        [@page.key, @item_label].join("|")
      end
    end

  end
end
