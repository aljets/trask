module Trask
  class Page < ActiveRecord::Base

    has_many :html_placements
    has_many :collection_placements

    validates :key, :uniqueness => true

  end
end
