class Test2 < ActiveRecord::Migration
  def up
execute "insert into revisions (revision, created_at, updated_at) values (1, '#{Time.now}', '#{Time.now}')"
  end

  def down
  end
end
