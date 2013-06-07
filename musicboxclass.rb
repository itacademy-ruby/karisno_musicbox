# -*- encoding : utf-8 -*-

class MusicBox

  def initialize
    @turned_on = false
    @songs = ['song1', 'song2', 'song3', 'song4']
    @song_cost = song_cost
  end

  attr_accessor :song_cost

  def turn_on
    unless @turned_on
      @turned_on = true
      puts "MusicBox was OFF"
      status
    else
      puts "MusicBox is ON"
    end
  end

  def turn_off
    if @turned_on
      @turned_on = false
      puts "MusicBox was ON"
      status
    else
      puts "MusicBox is OFF"
    end
  end

  def status
    if @turned_on
      puts "Status: MusicBox is ON"
    else
      puts "Status: MusicBox is OFF"
    end
  end

  def search
    puts "Enter the song name:"
    @entered_song_name = gets.chomp.to_s
    @songs.each { |i| if i == @entered_song_name
                        @present_song = true
                      end }
    if @present_song
      puts "The song " + "'" + @entered_song_name + "'" + " is present in playlist"
    else
      puts "The song " + "'" + @entered_song_name + "'" + " isn't present in playlist"
    end
  end

  def pay
    if @present_song
      puts "Insert the money to play the selected song:"
      @income_money = gets.chomp.to_i
      if @income_money < @song_cost
        puts "You haven't entered enough money"
      else
        @pay_ok = true
        puts "Thank you for your choice"
      end
    end
  end

  def load_song
    if @pay_ok
      puts "The song " + "'" + @entered_song_name + "'" + " is loading..."
    end
  end

  def play_music
    if @pay_ok
      puts "The song " + "'" + @entered_song_name + "'" + " is playing..."
    end
  end

  def self.media_type (mt)
    @mt = mt
    puts "'" +@mt + "'" +" mediatype"
  end

end


class MusicBoxCD < MusicBox
  self.media_type ("CD")
end

class MusicBoxVR < MusicBox
  self.media_type ("Vinyl Record")
end

box = MusicBoxCD.new
box.song_cost = 5
box.turn_on
box.search
box.pay
box.load_song
box.play_music
