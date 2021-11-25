module People
  class DataParser
    require 'csv'

    FILE_FORMATTERS = {
      dollar_format: ' $ ',
      percent_format: ' % '
    }

    attr_reader :params, :order

    def initialize(params)
      @params = params
      @order = params[:order]
    end

    def call
      data = []
      FILE_FORMATTERS.each do |key, value|
        # Collecting data from different format files.
        data += get_formatted_data(params[key], value)
      end

      data.sort_by { |datum| datum[order.to_s] }
    end

    private

    def get_formatted_data(data, formatter)
      rows = CSV.parse(data, headers: true, col_sep: formatter).map do |row|
        # Storing Date format to get flexibility to change date in later
        row["birthdate"] = Date.parse(row["birthdate"])
        row
      end
    end
  end
end