class Book < ApplicationRecord

  def price_with_tax
    price * 1.08
  end

  belongs_to :author

  validates :title, :price, presence: true
  validate :assert_uniqueness

  private
  def assert_uniqueness
    same_titles = self.class.where(title: title)
    same_titles_and_authors = same_titles.select {|book| book.author_id == self.author_id }
  end
end
