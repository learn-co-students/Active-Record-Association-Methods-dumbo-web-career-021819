class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    if Artist.all.select{|artist| artist.name == "Drake"} == []
      drake = Artist.create(name: "Drake")
      self.artist = Artist.all.find(drake.id)
    else
      self.artist = Artist.all.find_by(name: "Drake")
    end
  end
  
end
