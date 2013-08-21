class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :name
      t.string :time
      t.string :stage
      t.boolean :want_to_see
    end
  end
end
