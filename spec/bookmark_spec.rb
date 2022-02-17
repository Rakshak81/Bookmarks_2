require 'pg'
require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      
      Bookmark.create('http://www.makersacademy.com','makers')
      Bookmark.create('http://www.destroyallsoftware.com','destroy')
      Bookmark.create('http://www.google.com','google')

      bookmarks = Bookmark.all
      

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end 
  end

  describe '.create' do
    it 'adds a new bookmark' do
      Bookmark.create(url: "https://www.yahoo.com/", title: "Yahoo")
      expect(Bookmark.all).to include("https://www.yahoo.com/")
    end

    it 'adds a new bookmark' do
      Bookmark.create(url: "https://www.yahoo.com/", title: "Yahoo").first
      expect(bookmark['title']).to eq "Yahoo"   
    end
  end

end