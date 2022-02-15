require 'pg'
class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test')
    else 
      conn = PG.connect( dbname: 'bookmark_manager')
    end
    records = conn.exec( "SELECT * FROM bookmarks" )
    records.map { |bookmark| bookmark['url'] }
  end
end
    
 



# "http://www.makersacademy.com",
# "http://www.destroyallsoftware.com",
# "http://www.google.com"