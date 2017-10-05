require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
      }
    }
  }
end


def num_points_scored(player_name)
  game_hash.collect do |location, team_info|
    team_info[:players].collect do |name, stats|
      if name == player_name
        return stats[:points]
      end
    end
  end
end


def shoe_size(player_name)
  game_hash.collect do |location, team_info|
    team_info[:players].collect do |name, stats|
      if name == player_name
        return stats[:shoe]
      end
    end
  end
end


def team_colors(team)
  game_hash.collect do |location, team_info|
    if team_info[:team_name] == team
      return team_info[:colors]
    end
  end
end

def team_names
  game_hash.collect do |location, team_info|
    team_info[:team_name]
  end
end

def player_numbers(team)
  player_numbers_array = []
  game_hash.collect do |location, team_info|
    if team_info[:team_name] == team
      team_info[:players].collect do |name, stats|
        player_numbers_array << stats[:number]
      end
    end
  end

  player_numbers_array
end


def player_stats(player_name)
  game_hash.collect do |location, team_info|
    team_info[:players].collect do |name, stats|
     if name == player_name
       return stats
     end
   end
  end
end


def big_shoe_rebounds
  biggest_shoe = 0
  game_hash.collect do |location, team_info|
    team_info[:players].collect do |name, stats|
      player_shoe = stats[:shoe]
      if player_shoe > biggest_shoe
        biggest_shoe = stats[:shoe]
        return stats[:rebounds]
      end
    end
  end
end

# == BONUS == #

def most_points_scored
  points = []
  top_scorer = ""
  game_hash.collect do |location, team_info|
    team_info[:players].collect do |name, stats|
      points << stats[:points]
      if stats[:points] == points.sort[-1]
        top_scorer = name
      end
    end
  end
  return top_scorer
end


def winning_team
home_points = []
away_points = []
  game_hash.collect do |location, team_info|
    team_info[:players].collect do |name, stats|
        if location == :home
          home_points << team_info[:players][name][:points]
        else location == :away
          away_points << team_info[:players][name][:points]
        end
      end
  end

    home_points = home_points.reduce(:+)
    away_points = away_points.reduce(:+)

      if home_points > away_points
        return game_hash[:home][:team_name]
      else away_points > home_points
        return game_hash[:away][:team_name]
      end
end


def player_with_longest_name
  name_length = 0
  longest_name = ""
  game_hash.collect do |location, team_info|
    team_info[:players].collect do |name, stats|
      if name.length > name_length
        longest_name = name
      end
    end
  end
  return longest_name
end

# == SUPER BONUS == #

def long_name_steals_a_ton?
  name_length = 0
  longest_name = ""
  steals = []
  top_stealer = ""

  game_hash.collect do |location, team_info|
    team_info[:players].collect do |name, stats|
      steals << stats[:steals]
      if stats[:steals] == steals.sort[-1]
        top_stealer = name
      end
      if name.length > name_length
        longest_name = name
      end
    end
  end

  if longest_name == top_stealer
    true
  else
    false
  end

end


def scoreboard
  winning_team
binding.pry
end


=begin
"Home" [:team_name] total_points
"Away: TIMBERWOLVES 121"
=end
