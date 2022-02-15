require 'pg'
class Bookmark
  def self.all
    bookmark_arrays = []
    conn = PG.connect( dbname: 'bookmark_manager', user: 'rakshakshetty' )
    @records = conn.exec( "SELECT * FROM bookmarks" )
    @records.each do |bookmark|
     bookmark_arrays << bookmark['url']
    end
    bookmark_arrays
  end
end
    
 



# "http://www.makersacademy.com",
# "http://www.destroyallsoftware.com",
# "http://www.google.com"