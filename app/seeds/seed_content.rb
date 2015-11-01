connection = ActiveRecord::Base.connection


connection.execute "insert into revisions (revision, created_at, updated_at) values (1, '#{Time.now}', '#{Time.now}')"

connection.execute "insert into revisions (revision, created_at, updated_at) values (2, '#{Time.now}', '#{Time.now}')"


connection.execute "insert into amiibo_ids (identifier, name, created_at) values ('000a000000380102', 'Toad', '#{Time.now}')"
connection.execute "insert into revisions (revision, created_at, updated_at) values (3, '#{Time.now}', '#{Time.now}')"
