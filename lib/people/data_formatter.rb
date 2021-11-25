module People
  class DataFormatter
    require 'csv'

    attr_reader :rows

    def initialize(rows)
      @rows = rows
    end

    def call
      rows.map { |row| get_row_string(row) }
    end

    private

    def get_row_string(row)
      [
        first_name(row),
        city(row),
        birthdate(row),
      ].join(", ")
    end

    def first_name(row)
      row["first_name"]
    end

    def city(row)
      row["city"]
    end

    def birthdate(row)
      row["birthdate"].strftime("%-m/%-d/%Y")
    end
  end
end