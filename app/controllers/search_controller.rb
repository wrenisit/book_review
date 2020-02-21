class SearchController < ApplicationController
  def index
    book_conn = Faraday.new("http://openlibrary.org")
    book = book_conn.get("/search.json?title=#{params[:title]}")
    book_response = JSON.parse(book.body)
    @book = book_response["docs"][0]

    review_response = Faraday.get("https://api.nytimes.com/svc/books/v3/reviews.json?title=#{params[:title]}&api-key=zwhbSB78zpZbugeLb8MsAUCUHB2JKQq6")
    reviews = JSON.parse(review_response.body)
    @reviews = reviews["results"]
    binding.pry
  end

  def new
  end
end
