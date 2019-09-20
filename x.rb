vm = [[[{:name=>"Vanilla Cookies", :pieces=>3}, {:name=>"Pistachio Cookies",
:pieces=>3}, {:name=>"Chocolate Cookies", :pieces=>3}, {:name=>"Chocolate Chip
Cookies", :pieces=>3}], [{:name=>"Tooth-Melters", :pieces=>12},
{:name=>"Tooth-Destroyers", :pieces=>12}, {:name=>"Enamel Eaters",
:pieces=>12}, {:name=>"Dentist's Nighmare", :pieces=>20}], [{:name=>"Gummy Sour
Apple", :pieces=>3}, {:name=>"Gummy Apple", :pieces=>5}, {:name=>"Gummy Moldy
Apple", :pieces=>1}]], [[{:name=>"Grape Drink", :pieces=>1}, {:name=>"Orange
Drink", :pieces=>1}, {:name=>"Pineapple Drink", :pieces=>1}], [{:name=>"Mints",
:pieces=>13}, {:name=>"Curiously Toxic Mints", :pieces=>1000}, {:name=>"US
Mints", :pieces=>99}]]]

def snack_collection(machine)
  flat_snack_collection = []
  row_index = 0
  while row_index < machine.length do
    column_index = 0
    while column_index < machine[row_index].length do
      inner_len = machine[row_index][column_index].length
      inner_index = 0
      while inner_index < inner_len do
        flat_snack_collection <<
          machine[row_index][column_index][inner_index]
        inner_index += 1
      end
      column_index += 1
    end
    row_index += 1
  end
  flat_snack_collection
end

def summary_by_pieces(snacks)
  result = {}
  i = 0

  while i < snacks.length do
    snack_name = snacks[i][:name]
    snack_pieces = snacks[i][:pieces]
    # If there's no key for this number, add the number as a key and assign it
    # a new Array for holding future snacks with that number of pieces.
    if !result[snack_pieces]
      result[snack_pieces] = [ snack_name ]
    else
      result[snack_pieces] << snack_name
    end
    i += 1
  end

  result
end

def summary_snack_count_by_pieces(snacks)
  result = {}
  i = 0

  while i < snacks.length do
    snack_name = snacks[i][:name]
    snack_pieces = snacks[i][:pieces]
    # If there's no key for this number, add the number as a key and assign it
    # a new Array for holding future snacks with that number of pieces.
    if !result[snack_pieces]
      result[snack_pieces] = 1
    else
      result[snack_pieces] += 1
    end
    i += 1
  end

  result
end

pieces_collection = snack_collection(vm)
count_to_itemnames = summary_by_pieces(pieces_collection) 
p summary_snack_count_by_pieces(pieces_collection)
