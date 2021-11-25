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
    let(:parser_service) { People::DataParser.new(params)}

    it 'returns data of CSV::Row type' do
      expect(parser_service.call.sample.class.name).to eq ("CSV::Row")
    end

    it 'returns data sorted with first name' do
      expect(parser_service.call.collect { |row| row["first_name"] }).to eq [
        'Elliot',
        'Mckayla',
        'Rhiannon',
        'Rigoberto',
      ]
    end
  end
end
