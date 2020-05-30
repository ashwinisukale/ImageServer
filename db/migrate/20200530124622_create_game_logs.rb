class CreateGameLogs < ActiveRecord::Migration[5.2]
  def change
    drop_table :game_logs

    create_table :game_logs do |t|
      t.references :image, foreign_key: true
      t.datetime :capture_time

      t.timestamps
    end
  end
end
