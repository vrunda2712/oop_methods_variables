class Book

  @@on_shelf = []
  @@on_loan = []

  attr_accessor :due_date

  def initialize(title,author,isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def borrow
    if self.lent_out?
      false
    else
      @@on_loan << self
      @@on_shelf.delete(self)
      @due_date = Book.current_due_date
      true
    end
  end

  def return_to_library
    if self.lent_out?
      @@on_loan.delete(self)
      @@on_shelf << self
      @due_date = nil
      true
    else
      false
    end
  end

  def lent_out?
    @@on_loan.include?(self)
  end

  def self.create(title,author,isbn)
    new_book = Book.new(title,author,isbn)
    @@on_shelf << new_book
    new_book
  end

  def self.current_due_date
    due_date = 60 * 60 * 24 * 15 # 15 days
    Time.now + due_date
  end

  def self.overdue_books
    books = []
    @@on_loan.each do |book|
      if book.due_date > Time.now
        books << book
      end
    end
    books
  end

  def self.browse
    @@on_shelf.sample
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end

end

sister_outsider = Book.create("Sister Outsider","Audre Lorde","9781515905431")
aint_i = Book.create("Ain't I a woman?","Bell Hooks","9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")

puts Book.browse.inspect
puts Book.browse.inspect
puts Book.browse.inspect
puts
puts Book.available.inspect
puts Book.borrowed.inspect
puts
puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts sister_outsider.due_date
puts
puts Book.available.inspect
puts Book.borrowed.inspect
puts
puts Book.overdue_books.inspect
puts sister_outsider.return_to_library
puts sister_outsider.lent_out?
puts
puts Book.available.inspect
puts
puts Book.borrowed.inspect
