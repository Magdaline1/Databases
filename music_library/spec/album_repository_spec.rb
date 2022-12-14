require 'album_repository'

describe AlbumRepository do
    def reset_albums_table
        seed_sql = File.read('spec/seeds_album.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_albums_table
    end

    it 'returns all albums and their info' do
        repo = AlbumRepository.new
        albums = repo.all
        expect(albums.length).to eq 2
        expect(albums.first.id).to eq "1"
        expect(albums.first.title).to eq "Doolittle"
        expect(albums.first.release_year).to eq "1989"
    end

    it 'finds an album' do
        repo = AlbumRepository.new
        album = repo.find(2)
        expect(album.title).to eq "Surfer Rosa"
        expect(album.release_year).to eq "1988"
    end
end
