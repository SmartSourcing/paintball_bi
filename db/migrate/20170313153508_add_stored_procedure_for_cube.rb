class AddStoredProcedureForCube < ActiveRecord::Migration
  def change
    execute <<-SPROC
    CREATE OR REPLACE FUNCTION generate_players_data()
    RETURNS void AS
    $$

    BEGIN

      DROP TABLE IF EXISTS tmp_cube_players;

      CREATE TABLE tmp_cube_players  AS
        SELECT DISTINCT
          players.id as player_id,
          gears.id            as marker_id,
          gears.name          as marker,
          manufacturers.id    as manufacturer_id,
          manufacturers.name  as manufacturer,
          players.nationality as nationality
        FROM players
          inner join gears_players on players.id = gears_players.player_id
		      inner join gears on gears.id = gears_players.gear_id
          inner join manufacturers on gears.manufacturer_id = manufacturers.id;

      ALTER TABLE tmp_cube_players
          OWNER TO paintballapi;

    END;
    $$ LANGUAGE plpgsql;
    SPROC
  end
end
