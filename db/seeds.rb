puts "Cleaning up database..."
Song.destroy_all
Playlist.destroy_all
PlaylistSong.destroy_all
Show.destroy_all
SelectedShow.destroy_all

puts "Database cleaned"

keywords = ["wicked", "mamma-mia", "juliet", "hamilton-broadway", "moulin-rouge-musical", "the-lion-king", "aladdin-broadway", "six", "hadestown", "book-mormon", "chicago", "the-great-gatsby", "merrily-we-roll-along", "back-to-the-future", "little-shop-horrors", "cabaret", "sweeney-todd-2023","the-wiz","water-for-elephants","mj"]

keywords.each do |keyword|
  broadway_url = "https://www.broadway.com/shows/#{keyword}/"
  html_file = URI.open(broadway_url).read
  html_doc = Nokogiri::HTML.parse(html_file)

  description = html_doc.search(".showpage__story--content p").map(&:text).join("\n").strip
  image_url = html_doc.search(".showpage__hero--poster").attribute("data-src").value
  title = html_doc.search(".showpage__about-the-show--heading strong").map(&:text).join("\n").strip
  banner_url = html_doc.search(".showpage__hero--hero-image").attribute("data-srcset").value
  first_jpg_index = banner_url.index("jpg")
  banner_url = banner_url[0..first_jpg_index + 2]

  show = Show.create(title: title, description: description, image_url: image_url, banner_url: banner_url)


  album = RSpotify::Album.search(title).first

  if album.present?
    album.tracks.each do |track|
      song_title = track.name
      song_image_url = album.images.first['url']
      song_artists = track.artists.map(&:name)
      song_id = track.id

      Song.create(show_id: show.id, title: song_title, image_url: song_image_url, artists: song_artists, track_id: song_id)
    end
  else
    puts "Album not found for show: #{title}"
  end
end

puts "Shows and songs created"
