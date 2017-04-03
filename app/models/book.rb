class Book < ActiveRecord::Base
  #default_scope -> { order("published_on desc") }
  scope :constly, -> { where("price > ?", 3000) }
  scope :written_about, ->(theme) { where("name like ?", "%#{theme}%") }
  
  belongs_to :publisher
end
