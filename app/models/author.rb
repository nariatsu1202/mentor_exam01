class Author < ApplicationRecord

  def self.created_after(target_date)
    self.where("created_at > ?", target_date)
  end

  has_many :books
end
