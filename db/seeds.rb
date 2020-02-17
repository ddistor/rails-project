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

mayer = Nokogiri::XML(open('../app/data/JohnMayer/mayer.xml'))
name = mayer.search('artist/name').text
area = mayer.search('area/name').text
birth = mayer.search('life-span/begin').text
death = mayer.search('life-span/end').text
puts name
puts area
puts birth
puts death

gratefulDead = Nokogiri::XML(open('../app/data/GratefulDead/gratefuldead.xml'))
name = gratefulDead.search('artist/name').text
area = gratefulDead.search('area/name').text
birth = gratefulDead.search('life-span/begin').text
death = gratefulDead.search('life-span/end').text
puts name
puts area
puts birth
puts death

continuum = Nokogiri::XML(open('../app/data/JohnMayer/continuum.xml'))
album = continuum.search('release/title').text
label = continuum.search('release/title').text
releaseDate = continuum.search('release/date').text

puts album
puts area
puts label
puts releaseDate
songs = continuum.search('recording/title')
puts songs.class
# position = continuum.search
songs.each.with_index(1) do |song, index|
  puts song.to_str.gsub('<title>', '')
  puts index
end
