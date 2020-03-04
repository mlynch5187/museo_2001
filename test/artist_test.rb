require_relative 'test_helper'
require './lib/photograph'
require './lib/artist'

class ArtistTest < MiniTest::Test

  def setup
    attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"}
      @artist = Artist.new(attributes)
  end

  def test_artists_exist
    assert_instance_of Artist, @artist
  end

  def test_artists_have_attributes
    assert_equal "2", @artist.id
    assert_equal "Ansel Adams", @artist.name
    assert_equal "1902", @artist.born
    assert_equal "1984", @artist.died
    assert_equal "United States", @artist.country
    assert_equal 82, @artist.age_at_death
  end
end
