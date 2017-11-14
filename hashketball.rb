require 'pry'

  def game_hash
    game_hash = {
      :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => {
          "Alan Anderson" => {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          },
           "Reggie Evans" => {
             :number => 30,
             :shoe => 14,
             :points => 12,
             :rebounds => 12,
             :assists => 12,
             :steals => 12,
             :blocks => 12,
             :slam_dunks => 7
           },
           "Brook Lopez" => {
             :number => 11,
             :shoe => 17,
             :points => 17,
             :rebounds => 19,
             :assists => 10,
             :steals => 3,
             :blocks => 1,
             :slam_dunks => 15
           },
           "Mason Plumlee" => {
             :number => 1,
             :shoe => 19,
             :points => 26,
             :rebounds => 12,
             :assists => 6,
             :steals => 3,
             :blocks => 8,
             :slam_dunks => 5
           },
           "Jason Terry" => {
             :number => 31,
             :shoe => 15,
             :points => 19,
             :rebounds => 2,
             :assists => 2,
             :steals => 4,
             :blocks => 11,
             :slam_dunks => 1
           } #specific_player
        }#players
      }, #home

      :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => {
          "Jeff Adrien" => {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          },
           "Bismak Biyombo" => {
             :number => 0,
             :shoe => 16,
             :points => 12,
             :rebounds => 4,
             :assists => 7,
             :steals => 7,
             :blocks => 15,
             :slam_dunks => 10
           },
           "DeSagna Diop" => {
             :number => 2,
             :shoe => 14,
             :points => 24,
             :rebounds => 12,
             :assists => 12,
             :steals => 4,
             :blocks => 5,
             :slam_dunks => 5
           },
           "Ben Gordon" => {
             :number => 8,
             :shoe => 15,
             :points => 33,
             :rebounds => 3,
             :assists => 2,
             :steals => 1,
             :blocks => 1,
             :slam_dunks => 0
           },
           "Brendan Haywood" => {
             :number => 33,
             :shoe => 15,
             :points => 6,
             :rebounds => 12,
             :assists => 12,
             :steals => 22,
             :blocks => 5,
             :slam_dunks => 12
           } #specific_player
        }#players
      } #guest
    } #game_hash
    end

def num_points_scored(player_name)
  #if game_hash[:home][:players].include?(player_name)
#    game_hash[:home][:players][player_name][:points]
#  elsif game_hash[:away][:players].include?(player_name)
#      game_hash[:away][:players][player_name][:points]
#  end
#end
  num = 0
  game_hash.each do |key, values|
    if game_hash[key][:players][player_name]
      num = game_hash[key][:players][player_name][:points]
    end
  end
  num
end


def shoe_size(player_name)
  if game_hash[:home][:players].include?(player_name)
    game_hash[:home][:players][player_name][:shoe]
  elsif game_hash[:away][:players].include?(player_name)
    game_hash[:away][:players][player_name][:shoe]
  end
end

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team_name
    game_hash[:away][:colors]
  end
end

def team_names
  names = []
  game_hash.each do |side, infos|
    names << game_hash[side][:team_name]
  end
  names
end

def player_numbers(team)
  numbers = []
  game_hash.each do |side, infos|
    #below, why do we have to have 'game_hash'?  aren't we already inside :home?
    if game_hash[side][:team_name] == team
      game_hash[side][:players].each do |player_name, stat_keys|
        numbers << stat_keys[:number]
      end
    end
  end
  numbers
end

def player_stats(player_name)
    answer = ""
    game_hash.each do |side, infos|
      if game_hash[side][:players].include?(player_name)
          answer = game_hash[side][:players][player_name]
      end
    end
    answer
end

def big_shoe_rebounds
  shoe_sizes = {}
  game_hash.each do |side, infos|
    infos[:players].each do |player_name, stats|
      stats.each do |stat_name, value|
        if stat_name == :shoe
          shoe_sizes[player_name] = value
        end
      end
    end
  end
  winner = ""
  max_size = 0
  shoe_sizes.each do |player, size|
    if size > max_size
      max_size = size
      winner = player
    end
  end
  rebounds = 0
  game_hash.each do |side, infos|
    if game_hash[side][:players].include?(winner)
      rebounds = game_hash[side][:players][winner][:rebounds]
    end
  end
  rebounds
end
