class Author < ApplicationRecord
  has_many :books

  def self.created_after(target_date)
    self.where("created_at > ?", target_date)
  end

  def self.selector
    selector = Struct.new(:id, :name)
    @authors = Author.all.map { |author|
      name = author.family_name + " " + author.first_name
      selector.new(author.id, name)
    }
  end

    def fetch_a_book_by_price(option)
    case option
    when :max
      self.books.max_by{|book| book.price}
    when :min
      self.books.min_by{|book| book.price}
    else
      raise StandardError.new("Invalid Argument #{option} for 'option' in #{self.class.name}##{__method__}")
    end
  end

end
