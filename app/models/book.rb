class Book < ActiveRecord::Base
  scope :constly, -> { where("price > ?", 3000) }
end
