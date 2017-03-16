module Olap
  module Bi
    class Paintball

      @@connection = nil

      def initializer()

        config = Rails.configuration.database_configuration
        @@connection = Mondrian::OLAP::Connection.create(
            driver: config[Rails.env]['adapter'],
            database: config[Rails.env]['database'],
            username: config[Rails.env]['username'],
            password: config[Rails.env]['password'],
            schema: Marker.cube
        ) if @@connection.nil?
      end

      #= Markers by country
      #
      def by_country(country='all')

        country = (country == 'all') ? "[Nationalities].children" : "[Nationalities].[#{country}]"

        r = @@connection.from('Gears').
                columns('[Measures].[Players]').
                rows(country).
                nonempty().execute

        result = []
        result << r.axis_full_names[1]
        result << r.values
        result
      end

      #= Markers by country and manufacturer
      #
      def by_country_and_manufacturer(country='all',manufacturer='all')

        country       = (country == 'all') ?      "[Nationalities].children"  : "[Nationalities].[#{country}]"
        manufacturer  = (manufacturer == 'all') ? "[Manufacturer].children"   : "[Manufacturer].[#{manufacturer}]"

        r = @@connection.from('Gears').
            columns('[Measures].[Players]').
            rows(country).
            crossjoin(manufacturer).
            nonempty().execute

        result = []
        result << r.axis_full_names[1]
        result << r.values
        result
      end

      #= Markers by country and manufacturer and marker
      #
      def by_country_and_manufacturer(country, manufacturer)

        country       = "[Nationalities].[#{country}]"
        manufacturer  = "[Manufacturer].[#{manufacturer}]"

        r = @@connection.from('Gears').
            columns('[Measures].[Players]').
            rows('[Markers].children').
            crossjoin(country).
            crossjoin(manufacturer).
            nonempty().execute

        result = []
        result << r.axis_full_names[1]
        result << r.values
        result
      end
    end
  end
end
