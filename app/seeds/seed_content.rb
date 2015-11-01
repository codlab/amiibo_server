connection = ActiveRecord::Base.connection


connection.execute "insert into revisions (revision, created_at, updated_at) values (1, '#{Time.now}', '#{Time.now}')"

connection.execute "insert into revisions (revision, created_at, updated_at) values (2, '#{Time.now}', '#{Time.now}')"

connection.execute "insert into amiibo_ids (identifier, name) values ("000a000000380102", "Toad")"
connection.execute "insert into revisions (revision, created_at, updated_at) values (3, '#{Time.now}', '#{Time.now}')"
