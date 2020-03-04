class Curator
  attr_reader :photographs, :artists

  def initialize()
    @photographs = []
    @artists = []
  end

  def add_photograph(photograph)
    @photographs << photograph
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find { |artist| artist.id == id}
  end

  def photographs_by_artist
    photos_by_artist = Hash.new

    @artists.each do |artist|
      photos_by_artist[artist] = nil
    @photographs.each do |photo|
      if photo.artist_id == artist.id
        photos_by_artist[artist] = photo
      end
    end
  end
  photos_by_artist
  end
end
