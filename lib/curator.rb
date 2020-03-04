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
    photo_array = []

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

  def artists_with_multiple_photographs
    artists_mulit = @artists.find_all {|artist| (photographs_by_artist[artist].length > 1)}
    artists_multi.map { |artist| artist.name}
    end
  end

  def photographs_taken_by_artist_from(country)
    photos_from_country = []

    artist_country = @artists.each do |artist|
      artist.country

    @photographs.each do |photo|
      if photo.artist_id == artist.id
        photos_from_country << photo
      end
    end
    photos_from_country
  end
end
