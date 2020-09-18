require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)

  athletes_arr_of_hash = CSV.read(filename, headers: true).map(&:to_h)
  filtered_keys = athletes_arr_of_hash.map do |athlete|
    athlete.select do |key, value|
      ["ID", "Name", "Height", "Team", "Year", "City", "Sport", "Event", "Medal"].include? key
    end
  end
  return filtered_keys
end
# p get_all_olympic_athletes('../data/athlete_events.csv')
def total_medals_per_team(olympic_data)
  medal_hash = Hash.new(0)
  olympic_data.each do |athlete|
    if athlete["Medal"] != "NA"
      medal_hash[athlete["Team"]] += 1
    end
  end
  return medal_hash
end

# p total_medals_per_team(olympic_data)

def get_all_gold_medalists(olympic_data)
end


#1-
# -the get_all_olympic_athletes method get a file path and return array
# of Olympic athletes.
# -Check that we get back an array
# -Check that each element in the array is a hash

# ==============
# 2-1:"expect(olympic_athletes).must_be_instance_of Array" check that we get back an arr
# then we loop trough the arr and "expect(athlete).must_be_instance_of Hash" check that each element in the array is a hash
# 2-2:we check if the length of the key is equal to the length of the key inside the constant variable "REQUIRED_OLYMPIAN_FIELDS"
# "expect(athlete.keys.length).must_equal REQUIRED_OLYMPIAN_FIELDS.length"
# 2-3: by looping through the "REQUIRED_OLYMPIAN_FIELDS" we check that if "required_field" are in our key list
# "REQUIRED_OLYMPIAN_FIELDS.each do |required_field|"
# "expect(athlete.keys).must_include required_field"
# 2-4: we missed to check if the path file is string
# =============
#3 -
# - what if the file path file is not correct
# - what if some value of the keys are missing
# - what if the some of the keys not matched