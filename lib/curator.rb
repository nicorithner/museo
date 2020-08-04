class Curator
  attr_reader :photographs, :artists
  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def photographs_by_artist
    list = Hash.new{|h,k| h[k] = []}
    @photographs.each do |photo|
      artist = @artists.find {|artist| photo.artist_id == artist.id }
      list[artist] <<= photo
    end
    list
  end

  def artists_with_multiple_photographs
    photographs_by_artist.map {|artist, photos| artist.name if photos.count > 1 }.compact
  end

  def photographs_taken_by_artist_from(country)
    photographs_by_artist.map {|artist, photos| photos if artist.country == country }.flatten.compact
  end

  def photographs_taken_between(range)
    photographs_by_artist.map do |artist, photos| 
      photos.select {|photo| photo if range.include?(photo.year.to_i)} 
    end.flatten

  end
end