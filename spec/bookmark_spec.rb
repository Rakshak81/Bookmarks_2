require 'pg'
require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      
      Bookmark.create('http://www.makersacademy.com','makers')
      Bookmark.create('http://www.destroyallsoftware.com','destroy')
      Bookmark.create('http://www.google.com','google')

      bookmarks = Bookmark.all

      this_bookmark = bookmarks.first
      
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq this_bookmark.id
      expect(bookmarks.first.title).to eq 'makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

      # expect(bookmarks).to include("http://www.makersacademy.com")
      # expect(bookmarks).to include("http://www.destroyallsoftware.com")
      # expect(bookmarks).to include("http://www.google.com")
    end 
  end

  describe '.create' do
    # it 'adds a new bookmark' do
    #   Bookmark.create(url: "https://www.yahoo.com/", title: "Yahoo")
    #   expect(Bookmark.all).to include("https://www.yahoo.com/")
    # end

    it 'adds a new bookmark' do
      # Bookmark.create(url: "https://www.yahoo.com/", title: "Yahoo").first
      # expect(bookmark['title']).to eq "Yahoo"   
      this_bookmark = Bookmark.create("https://www.yahoo.com/", "Yahoo").first
      expect(this_bookmark['title']).to eq "Yahoo"   
    end
  end

end