class CreateImage < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :gallery, foreign_key: true
    end
  end
end
