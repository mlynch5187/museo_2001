require_relative 'test_helper'
require './lib/photograph'
require './lib/artist'
require './lib/curator'

class CuratorTest < MiniTest::Test

  def setup
    @curator = Curator.new
    @photo_1 = Photograph.new({
         id: "1",
         name: "Rue Mouffetard, Paris (Boy with Bottles)",
         artist_id: "1",
         year: "1954"})
    @photo_2 = Photograph.new({
         id: "2",
         name: "Moonrise, Hernandez",
         artist_id: "2",
         year: "1941"})
    @artist_1 = Artist.new({
          id: "1",
          name: "Henri Cartier-Bresson",
          born: "1908",
          died: "2004",
          country: "France"})
    @artist_2 = Artist.new({
          id: "2",
          name: "Ansel Adams",
          born: "1902",
          died: "1984",
          country: "United States"})
  end

  def test_curators_exist
    assert_instance_of Curator, @curator
  end

  def test_curators_have_attributes
    assert_equal [], @curator.photographs
    assert_equal [], @curator.artists
  end

  def test_photoraphs_can_be_added
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)

    assert_equal [@photo_1, @photo_2], @curator.photographs
  end

  def test_curators_can_add_artists
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)

    assert_equal [@artist_1, @artist_2], @curator.artists
  end

  def test_artists_can_be_found_by_id
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    
    assert_equal @artist_1, @curator.find_artist_by_id("1")
  end
end
