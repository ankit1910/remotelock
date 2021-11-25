require 'spec_helper'

RSpec.describe 'Lib Data Parser Test' do
  describe 'Sorted and non formatted data.' do
    let(:params) do
      {
        dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
        percent_format: File.read('spec/fixtures/people_by_percent.txt'),
        order: :first_name,
      }
    end
    let(:parsed_data) { People::DataParser.new(params).call }
    let(:formatter_service) { People::DataFormatter.new(parsed_data) }

    it 'parses input files and outputs normalized data' do
      expect(formatter_service.call).to eq [
        'Elliot, New York City, 5/4/1947',
        'Mckayla, Atlanta, 5/29/1986',
        'Rhiannon, LA, 4/30/1974',
        'Rigoberto, NYC, 1/5/1962',
      ]
    end
  end
end
