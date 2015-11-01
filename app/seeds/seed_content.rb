def insert_if_not_exists(connection, name, identifier)
  count = connection.execute "select count(*) from amiibo_ids where identifier = '#{identifier}'"
  count = count.to_a
  Rails.logger.info("count #{count}")
  if count == 0
    connection.execute "insert into amiibo_ids (identifier, name, created_at, updated_at) values ('#{identifier}', '#{name}', '#{Time.now}', '#{Time.now}')"
  end
end

def insert_if_not_exists_revision(connection, revision)
  count = connection.execute "select count(*) from revisions where revision = #{revision}"
  count = count.to_a
  Rails.logger.info("count revision #{count}")
  if count == 0
    connection.execute "insert into revisions (revision, created_at, updated_at) values (#{revision}, '#{Time.now}', '#{Time.now}')"
  end
end

connection = ActiveRecord::Base.connection

insert_if_not_exists_revision(connection, 1)
insert_if_not_exists_revision(connection, 2)

insert_if_not_exists("Toad", "000a000000380102")
insert_if_not_exists_revision(connection, 3)
