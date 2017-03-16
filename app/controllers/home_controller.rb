require 'olap'

class HomeController < ApplicationController
  def index

    bi    = Olap::Bi::Paintball.new
    @data = bi.by_model_by_manfacturer('all','all')

=begin

def markers_model_by_country_and_manufacturer

        country       = "[Nationalities].[#{params[:country]}]"
        manufacterer  = "[Manufacturers].[#{params[:manufacturer]}]"

        q = @@connection.from('Gears').
            columns('[Measures].[Markers]').
            rows('[Markers].children').
            crossjoin(manufacterer).
            crossjoin(country).
            nonempty()

        puts "query: #{q.to_mdx}"

        r = q.execute
        result = []
        result << r.axis_full_names[1]
        result << r.values

        render json: { status: 'ok', data: result }
      end

=end

  end
end
