namespace :db do
  namespace :seed do

    desc "Create players data"
    task :players=> :environment do
      players = FactoryGirl.create_list(:player, 500)

      players.each do |player|

        player.gears << Gear.markers.sample
      end
    end

    desc "Create cube data"
    task :cube=> :environment do

      ActiveRecord::Base.connection.exec_query %Q{select generate_players_data();}
    end

    desc 'import the data'
    task :nationalities => :environment do

      countries = TZInfo::Country.all.collect{ |x| [x.name, x.code] }.sort
      countries.each do |c|
        code = c[1]
        desc = c[0]

        Nationality.create!(code: code, description: desc)
      end
    end
  end
end
