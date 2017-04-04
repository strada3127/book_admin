class Book < ActiveRecord::Base
  #default_scope -> { order("published_on desc") }
  scope :constly, -> { where("price > ?", 3000) }
  scope :written_about, ->(theme) { where("name like ?", "%#{theme}%") }
  
  # １対多 
  belongs_to :publisher
  
  # 多対多
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence: true
  validates :name, length: { maximum: 15}
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  
  # カスタムバリデーション
  validate do |book|
    if book.name.include?("exercise")
      book.errors[:name] << "I don't like exercise."
    end
  end

  #before_validation do |book|
  #  book.name = self.name.gsub(/Cat/) do |matched|
  #    "lovely #{matched}"
  #  end
  #end

  #メソッドを使った書き方
  before_validation :add_lovely_to_cat
  def add_lovely_to_cat
    book.name = book.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end
end

