require 'book'

class BookRepository

    def all
        result = DatabaseConnection.exec_params('SELECT id, title, author_name FROM books;', [])

        books = []

        result.each do |record|
            book = Book.new
            book.id = record['id']
            book.title = record['title']
            book.author_name = record['author_name']

            books << book
        end
        return books

    end
end
  