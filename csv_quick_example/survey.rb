require 'csv'
require 'pry'
class Survey

    attr_accessor :filename

    def initialize(filename)
        self.filename = filename
    end

    def open_file
        just_read = CSV.read(filename)
        #table = CSV.parse(File.read(filename), headers: true)    
    end

    def display_countent
        open_file.each {|array| puts array.join(", ")}
    end
end

survey = Survey.new("cigarette-smoking-behaviour-2018-census-csv.csv")
survey.display_countent

=begin
just_read = [["Code",
  "Cigarette_smoking_behaviour",
  "Census_usually_resident_population_count_aged_15_years_and_over"],
 ["1", "Regular smoker", "498996"],
 ["2", "Ex-smoker", "832104"],
 ["3", "Never smoked regularly", "2445252"],
 ["7", "Response unidentifiable", "0"],
 ["9", "Not stated", "0"],
 ["TotalStated", "Total stated", "3776355"],
 ["Total", "Total", "3776355"]]
 
 table = => #<CSV::Table mode:col_or_row row_count:8>
=end