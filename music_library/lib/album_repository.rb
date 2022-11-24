require_relative './album'

class AlbumRepository
    def all
        result = DatabaseConnection.exec_params('SELECT id, title, release_year FROM albums;', [])

        albums = []

        result.each do |record|
            album = Album.new
            album.id = record['id']
            album.title = record['title']
            album.release_year = record['release_year']

            albums << album
        end
        return albums

    end

    def find(id)
        sql = 'SELECT id, title, release_year FROM albums WHERE id = $1;'
        sql_params = [id]

        result = DatabaseConnection.exec_params(sql, sql_params)
        record = result[0]

        found_albums = []

        result.each do |record|
            album = Album.new
            album.id = record['id']
            album.title = record['title']
            album.release_year = record['release_year']
            
            found_albums << album
        end

        return found_albums[0]
    end
end