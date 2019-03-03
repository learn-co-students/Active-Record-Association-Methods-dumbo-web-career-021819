class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def genres_songs
    Song.all.select {|song|
      song.genre_id = self.id
    }
  end

  def song_count
    genres_songs.length
  end

  def artist_count
    arr_of_artists = genres_songs.map {|song|
      song.artist
    }
    arr_of_artists.uniq.length
  end

  def all_artist_names
    arr_of_artists_names = genres_songs.map {|song|
      song.artist.name
    }
    # return an array of strings containing every musician's name
  end
end
