require 'spec_helper'


# describe 'total_gross' do
#   it 'correctly totals the total gross' do
#     expect(total_gross(directors_database)).to eq(10355501925)
#   end
# end
# 
# describe 'list of directors' do
#   it 'correctly extracts :name keys out of an AoH where'  do
#     stooges = [{:name => "Larry"}, {:name => "Curly"}, {:name => "Moe"}, {:name => "Iggy"}]
#     expect(list_of_directors(stooges)).to eq(["Larry", "Curly", "Moe", "Iggy"])
#   end
# end
# 
# describe 'gross_for_director method' do
#   it "correctly totals the worldwide earnings for a director" do
#     first_director_name = directors_database.first.values.first
#     first_director_hash = directors_database.find{ |x| x[:name] == first_director_name }
#     expect(gross_for_director(first_director_hash)).to eq(1357566430)
#   end
# end
# 

describe 'The directors_database method can be processed by the studios_totals method' do
  describe "and correctly totals the directors' totals" do
    let(:expected) {
      {
       "Universal"=>1278335390,
       "Columbia"=>217711904,
       "Paramount"=>2382072020,
       "Buena Vista"=>2602319056,
       "Warner Brothers"=>1174295617,
       "Fox"=>1280043473,
       "TriStar"=>205881154,
       "Focus"=>49275340,
       "Dreamworks"=>155464351,
       "Weinstein"=>283346153,
       "Sony"=>135156125,
       "Miramax"=>508129831,
       "MGM"=>83471511
      }
    }

    it "correctly total 'Universal'" do
      expect(studios_totals(directors_database)['Universal']).to eq(expected['Universal'])
    end
    it "correctly total 'Columbia'" do
      expect(studios_totals(directors_database)['Columbia']).to eq(expected['Columbia'])
    end
    it "correctly total 'Paramount'" do
      expect(studios_totals(directors_database)['Paramount']).to eq(expected['Paramount'])
    end
    it "correctly total 'Buena Vista'" do
      expect(studios_totals(directors_database)['Buena Vista']).to eq(expected['Buena Vista'])
    end
    it "correctly total 'Warner Brothers'" do
      expect(studios_totals(directors_database)['Warner Brothers']).to eq(expected['Warner Brothers'])
    end
    it "correctly total 'Fox'" do
      expect(studios_totals(directors_database)['Fox']).to eq(expected['Fox'])
    end
    it "correctly total 'TriStar'" do
      expect(studios_totals(directors_database)['TriStar']).to eq(expected['TriStar'])
    end
    it "correctly total 'Focus'" do
      expect(studios_totals(directors_database)['Focus']).to eq(expected['Focus'])
    end
    it "correctly total 'Dreamworks'" do
      expect(studios_totals(directors_database)['Dreamworks']).to eq(expected['Dreamworks'])
    end
    it "correctly total 'Weinstein'" do
      expect(studios_totals(directors_database)['Weinstein']).to eq(expected['Weinstein'])
    end
    it "correctly total 'Sony'" do
      expect(studios_totals(directors_database)['Sony']).to eq(expected['Sony'])
    end
    it "correctly total 'Miramax'" do
      expect(studios_totals(directors_database)['Miramax']).to eq(expected['Miramax'])
    end
    it "correctly total 'MGM'" do
      expect(studios_totals(directors_database)['MGM']).to eq(expected['MGM'])
    end



  end
end
