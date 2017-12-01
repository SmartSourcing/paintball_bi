require 'mondrian-olap'

class Marker < ActiveRecord::Base

  class << self

      def cube

        schema = Mondrian::OLAP::Schema.define do
          cube 'Gears' do
            table 'tmp_cube_players'

            dimension "Manufacturers" do
              hierarchy hasAll: "true" do
                level name: "Manufacturer", column: "manufacturer", uniqueMembers: "true"
              end
            end

            dimension "Markers" do
              hierarchy hasAll: "true" do
                level name: "Marker",column: "marker", uniqueMembers: "true"
              end
            end

            dimension "Nationalities" do
              hierarchy hasAll: "true" do
                level name: "Nationality", column: "nationality", uniqueMembers: "true"
              end
            end

            measure 'Players', :column => 'player_id', :aggregator => 'count'
          end
        end
        return schema
      end
    end
 end
