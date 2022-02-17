require 'pg'
class Bookmark
  attr_reader :id, :title, :url
  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test')
    else 
      conn = PG.connect( dbname: 'bookmark_manager')
    end
    records = conn.exec( "SELECT * FROM bookmarks" )
    # records.map { |bookmark| bookmark[['url'],['title']] }
    records.map do |thangamy|
      Bookmark.new(thangamy['id'], thangamy['title'], thangamy['url'])
  end
  end

  def self.create(url,title)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test')
    else 
      conn = PG.connect( dbname: 'bookmark_manager')
    end
    conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING url, title;")

    # conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}','#{title}');")

  end

end
    
 



# "http://www.makersacademy.com",
# "http://www.destroyallsoftware.com",
# "http://www.google.com"