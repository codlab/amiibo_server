connection = ActiveRecord::Base.connection
connection.execute "insert into revisions (revision, created_at, updated_at) values (1, '#{Time.now}', '#{Time.now}')"
