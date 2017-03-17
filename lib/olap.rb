module Olap
  module Bi
    class Paintball

      @connection = nil

      def initialize()

        config = Rails.configuration.database_configuration
        @connection = Mondrian::OLAP::Connection.create(
            driver: config[Rails.env]['adapter'],
            database: config[Rails.env]['database'],
            username: config[Rails.env]['username'],
            password: config[Rails.env]['password'],
            schema: Marker.cube
        ) if @connection.nil?
        puts "connected"
      end

      #= Markers by country
      #
      def by_country(country='all')

        result  = [ ['Country', 'Amount'] ]
        country = (country == 'all') ? "[Nationalities].children" : "[Nationalities].[#{country}]"

        r = @connection.from('Gears').
                columns('[Measures].[Players]').
                rows(country).
                nonempty().execute

        r.axis_full_names[1].each_with_index {|country, index|

          c = TZInfo::Country.get(country.split('.')[1].gsub('[','').gsub(']','')).name
          v = r.values[index][0]
          result << [ c , v ]
        }
        result
      end

      #= Markers by country and manufacturer
      #
      def by_country_and_manufacturer(country)

        country       = "[Nationalities].[#{country}]"
        manufacturer  = "[Manufacturers].children"
        marker        = "[Markers].children"

        r = @connection.from('Gears').
            columns('[Measures].[Players]').
            rows(country).
            crossjoin(manufacturer).
            nonempty().
            execute

        result = []
        r.axis_full_names[1].each_with_index {|data, index|

          c = data[1].split('.')[1].delete('[]')
          v = r.values[index][0].to_i
          result << [ c , v ]
        }
        result
      end

      def by_country_and_manufacturer_and_marker(country, manufacturer)
        country       = "[Nationalities].[#{country}]"
        manufacturer  = "[Manufacturers].[#{manufacturer}]"
        marker        = "[Markers].children"

        r = @connection.from('Gears').
            columns('[Measures].[Players]').
            rows(country).
            crossjoin(manufacturer).
            crossjoin(marker).
            nonempty().
            execute

        result = []
        r.axis_full_names[1].each_with_index {|data, index|

          c = data[2].split('.')[1].delete('[]')
          v = r.values[index][0].to_i
          result << [ c , v ]
        }
        result
      end
    end
  end
end
