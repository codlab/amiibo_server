class Test < ActiveRecord::Migration
  def up
execute "insert into revisions (revision, created_at, updated_at) values (1, '#{Time.now}', '#{Ti
me.now}')"
  end

  def down
  end
end
