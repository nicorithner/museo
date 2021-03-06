require "./test/test_helper"

class CuratorTest < Minitest::Test

  def test_it_exists
    curator = Curator.new
    assert_instance_of Curator, curator
  end

  def test_has_attributes
    curator = Curator.new
    
    assert_equal = [], curator.photographs
  end

  def test_it_can_add_photographs
    curator = Curator.new
    photo_1 = Photograph.new({
                            id: "1",      
                            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
                            artist_id: "1",      
                            year: "1954"      
                            })  

    photo_2 = Photograph.new({
                            id: "2",      
                            name: "Moonrise, Hernandez",      
                            artist_id: "2",      
                            year: "1941"      
                            })

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)

    assert_equal = [photo_1, photo_2], curator.photographs
  end

  def test_it_can_add_artists
    curator = Curator.new

    assert_equal = [], curator.artists

    artist_1 = Artist.new({
                          id: "1",      
                          name: "Henri Cartier-Bresson",      
                          born: "1908",      
                          died: "2004",      
                          country: "France"      
                          })
    artist_2 = Artist.new({
                          id: "2",      
                          name: "Ansel Adams",      
                          born: "1902",      
                          died: "1984",      
                          country: "United States"      
                          })

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

    assert_equal = [artist_1, artist_2], curator.artists
  end

  def test_it_can_sort_photographs_by_artist
    curator = Curator.new
    photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "1",      
      year: "1954"      
      })
    photo_2 = Photograph.new({    
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
      })
    photo_3 = Photograph.new({    
      id: "3",      
      name: "Identical Twins, Roselle, New Jersey",      
      artist_id: "3",      
      year: "1967"      
      })
    photo_4 = Photograph.new({    
      id: "3",      
      name: "Monolith, The Face of Half Dome",      
      artist_id: "3",      
      year: "1927"      
      })
    artist_1 = Artist.new({    
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
      })
    artist_2 = Artist.new({    
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
      })
    artist_3 = Artist.new({    
      id: "3",      
      name: "Diane Arbus",      
      born: "1923",      
      died: "1971",      
      country: "United States"      
      })
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    expected = {artist_1 => [photo_1], artist_2 => [photo_2], artist_3 => [photo_3, photo_4]}

    assert_equal expected, curator.photographs_by_artist
  end

  def test_it_can_find_artists_with_multiple_photos
    curator = Curator.new
    photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "1",      
      year: "1954"      
      })
    photo_2 = Photograph.new({    
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
      })
    photo_3 = Photograph.new({    
      id: "3",      
      name: "Identical Twins, Roselle, New Jersey",      
      artist_id: "3",      
      year: "1967"      
      })
    photo_4 = Photograph.new({    
      id: "3",      
      name: "Monolith, The Face of Half Dome",      
      artist_id: "3",      
      year: "1927"      
      })
    artist_1 = Artist.new({    
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
      })
    artist_2 = Artist.new({    
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
      })
    artist_3 = Artist.new({    
      id: "3",      
      name: "Diane Arbus",      
      born: "1923",      
      died: "1971",      
      country: "United States"      
      })
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    assert_equal ["Diane Arbus"], curator.artists_with_multiple_photographs
  end

  def test_it_can_find_photographs_taken_by_artist_from_country
    curator = Curator.new
    photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "1",      
      year: "1954"      
      })
    photo_2 = Photograph.new({    
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
      })
    photo_3 = Photograph.new({    
      id: "3",      
      name: "Identical Twins, Roselle, New Jersey",      
      artist_id: "3",      
      year: "1967"      
      })
    photo_4 = Photograph.new({    
      id: "3",      
      name: "Monolith, The Face of Half Dome",      
      artist_id: "3",      
      year: "1927"      
      })
    artist_1 = Artist.new({    
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
      })
    artist_2 = Artist.new({    
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
      })
    artist_3 = Artist.new({    
      id: "3",      
      name: "Diane Arbus",      
      born: "1923",      
      died: "1971",      
      country: "United States"      
      })
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    assert_equal [photo_2, photo_3, photo_4], curator.photographs_taken_by_artist_from("United States")
    assert_equal [], curator.photographs_taken_by_artist_from("Argentina")
  end

  def test_it_can_find_photographs_taken_between_certain_years
    curator = Curator.new
    photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "1",      
      year: "1954"      
      })
    photo_2 = Photograph.new({    
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
      })
    photo_3 = Photograph.new({    
      id: "3",      
      name: "Identical Twins, Roselle, New Jersey",      
      artist_id: "3",      
      year: "1967"      
      })
    photo_4 = Photograph.new({    
      id: "3",      
      name: "Monolith, The Face of Half Dome",      
      artist_id: "3",      
      year: "1927"      
      })

    artist_1 = Artist.new({    
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
      })
    artist_2 = Artist.new({    
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
      })
    artist_3 = Artist.new({    
      id: "3",      
      name: "Diane Arbus",      
      born: "1923",      
      died: "1971",      
      country: "United States"      
      })
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    assert_equal [photo_1, photo_3], curator.photographs_taken_between(1950..1967)
  end

  def test_it_can_find_artist_by_id
    curator = Curator.new
    photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "1",      
      year: "1954"      
      })
    photo_2 = Photograph.new({    
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
      })
    photo_3 = Photograph.new({    
      id: "3",      
      name: "Identical Twins, Roselle, New Jersey",      
      artist_id: "3",      
      year: "1967"      
      })
    photo_4 = Photograph.new({    
      id: "3",      
      name: "Monolith, The Face of Half Dome",      
      artist_id: "3",      
      year: "1927"      
      })

    artist_1 = Artist.new({    
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
      })
    artist_2 = Artist.new({    
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
      })
    artist_3 = Artist.new({    
      id: "3",      
      name: "Diane Arbus",      
      born: "1923",      
      died: "1971",      
      country: "United States"      
      })
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    diane_arbus = curator.find_artist_by_id("3")
    
    assert_equal "Diane Arbus", diane_arbus.name
  end

  def test_it_can_sort_photographs_by_the_age_of_the_artist_when_taken
    skip
    curator = Curator.new
    photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "1",      
      year: "1954"      
      })
    photo_2 = Photograph.new({    
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
      })
    photo_3 = Photograph.new({    
      id: "3",      
      name: "Identical Twins, Roselle, New Jersey",      
      artist_id: "3",      
      year: "1967"      
      })
    photo_4 = Photograph.new({    
      id: "3",      
      name: "Monolith, The Face of Half Dome",      
      artist_id: "3",      
      year: "1927"      
      })

    artist_1 = Artist.new({    
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
      })
    artist_2 = Artist.new({    
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
      })
    artist_3 = Artist.new({    
      id: "3",      
      name: "Diane Arbus",      
      born: "1923",      
      died: "1971",      
      country: "United States"      
      })
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    
    expected = {44=>"Identical Twins, Roselle, New Jersey", 39=>"Child with Toy Hand Grenade in Central Park"}
    assert_equal expected, curator.artists_photographs_by_age(diane_arbus)
  end

end