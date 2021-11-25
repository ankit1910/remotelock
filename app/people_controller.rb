require_relative '../lib/people/data_parser'
require_relative '../lib/people/data_formatter'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    people_data = People::DataParser.new(params).call
    People::DataFormatter.new(people_data).call
  end

  private

  attr_reader :params
end
