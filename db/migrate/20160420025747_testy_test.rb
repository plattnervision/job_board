class TestyTest < ActiveRecord::Migration
  def up
    add_column :jobs, :test_thing,:text
    rename_column :jobs, :test_thing, :good_thing
  end
  # def change
  #   add_column :jobs, :test_thing, :text
  # end
  def down
    rename_column :jobs, :good_thing, :test_thing
    remove_column :jobs, :test_thing
  end
end
