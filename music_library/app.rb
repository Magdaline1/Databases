require_relative 'lib/database_connection'
require_relative 'lib/album_repository'

DatabaseConnection.connect('music_library')

album_repository = AlbumRepository.new


album = album_repository.find(3)

puts album.id
puts album.title
puts album.release_year


=begin 
result = DatabaseConnection.exec_params('SELECT * FROM albums WHERE id = $3;', [])
result.each do |record|
    record
    p "#{record['id']} - #{record['title']} - #{record['release_year']}"
end
=end