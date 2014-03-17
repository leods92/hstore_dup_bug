class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.hstore :options

      t.timestamps
    end
  end
end
