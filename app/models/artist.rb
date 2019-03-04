class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    #return the genre of the artist's first saved song
    genres.first
  end

  def song_count
    songs.count
  end

  def genre_count
    genres.count
  end
end
