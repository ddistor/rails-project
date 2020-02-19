# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nokogiri'
require 'open-uri'

Song.destroy_all
Album.destroy_all
Artist.destroy_all
Band.destroy_all
# puts Dir.exist?('app/data/JohnMayer')
artists = Dir.entries('app/data/artist')
# artists
artists.each do |artist_name|
  next unless artist_name.length > 4

  artist = Nokogiri::XML(open("app/data/artist/#{artist_name}/#{artist_name}.xml"))
  name = artist.search('artist/name').text
  area = artist.search('area/name').text
  birth = artist.search('life-span/begin').text
  death = artist.search('life-span/end').text

  artist_create = Artist.create(name: name, area: area, birth: birth, death: death)

  albums = Dir.entries("app/data/artist/#{artist_name}/album/")
  albums.each do |album_name|
    next unless album_name.include? 'xml'

    album = Nokogiri::XML(open("app/data/artist/#{artist_name}/album/#{album_name}"))
    name = album.search('release/title').text
    label = album.search('label/name').text
    release_date = album.search('release/date').text

    album_create = artist_create.albums.create(name: name, label: label, release_date: release_date)
    song_length = album.search('track/length')
    songs_list = album.search('recording/title')
    songs_list.each.with_index(1) do |song, index|
      title = song.to_s.gsub('<title>', '').gsub('</title>', '')
      length = song_length[index - 1].to_s.gsub('<length>', '').to_i
      position = index
      album_create.songs.create(title: title, length: length, position: position)
    end
  end
end

bands = Dir.entries('app/data/band')
bands.each do |band_name|
  next unless band_name.length > 4

  band = Nokogiri::XML(open("app/data/band/#{band_name}/#{band_name}.xml"))
  name = band.search('artist/name').text
  area = band.search('area/name').text
  founded = band.search('life-span/begin').text
  disbanded = band.search('life-span/end').text

  band_create = Band.create(name: name, area: area, founded: founded, disbanded: disbanded)
  puts band_create
  albums = Dir.entries("app/data/band/#{band_name}/album/")
  albums.each do |album_name|
    next unless album_name.include? 'xml'

    album = Nokogiri::XML(open("app/data/band/#{band_name}/album/#{album_name}"))
    name = album.search('release/title').text
    label = album.search('label/name').text
    release_date = album.search('release/date').text

    album_create = band_create.albums.create(name: name, label: label, release_date: release_date)
    song_length = album.search('track/length')
    songs_list = album.search('recording/title')
    songs_list.each.with_index(1) do |song, index|
      title = song.to_s.gsub('<title>', '').gsub('</title>', '')
      length = song_length[index - 1].to_s.gsub('<length>', '').gsub('</length>', '').to_i
      position = index
      album_create.songs.create(title: title, length: length, position: position)
    end
  end
end

# bands

puts "Created #{Artist.count} Artists."
puts "Created #{Band.count} Bands."
puts "Created #{Album.count} Albums."
puts "Created #{Song.count} Songs."
