require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, holidays|
    if season == :winter
      holidays.each {|holiday, supplies| supplies << supply}
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array

  holiday_hash.each do |season, holidays|
    if season == :spring
      holidays.each {|holiday, supplies| supplies << supply}
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash

  holiday_hash.each do |season_hash, holidays|
    if season_hash == season
      holiday_hash[season_hash][holiday_name] = supply_array
    end
  end

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash.each do |season, holidays|
    if season == :winter
      return holidays.values.flatten
    end
  end

end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays|
    puts season.to_s.capitalize + ":"
    holidays.each do |holiday, supplies|
      holiday_string = "  "
      if holiday.to_s.include?("_")
        temp_string = holiday.to_s.split('_')
        temp_string.each_with_index {|string, index| temp_string[index] = string.capitalize}
        holiday_string += temp_string.join(" ") + ": "
      else
        holiday_string += holiday.to_s.capitalize + ": "
      end
      i = 0
      while supplies.length > i
        if supplies[i] == supplies[-1]
          if supplies[i] == "BBQ"
            holiday_string+= supplies[i]
          elsif supplies[i].include?(" ")
            supply_string = supplies[i].split
            supply_string.each_with_index {|word, index| supply_string[index] = word.capitalize}
            holiday_string += supply_string.join(" ")
          else
            holiday_string += supplies[i].capitalize
          end
        else
          if supplies[i] == "BBQ"
            holiday_string += supplies[i] + ", "
          elsif  supplies[i].include?(" ")
            supply_string = supplies[i].split
            supply_string.each_with_index {|word, index| supply_string[index] = word.capitalize}
            holiday_string += supply_string.join(" ") + ", "
          else
            holiday_string += supplies[i].capitalize + ", "
          end
        end
        i += 1
      end
      puts holiday_string
    end
  end


end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

end
