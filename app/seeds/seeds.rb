current_revision = 3

count = Revision.count
first_revision = 0
if count > 0
  first_revision = Revision.order("revision DESC").first.revision
end

Rails.logger.info("count :: #{count} // first_revision :: #{first_revision}")

if count == 0 or first_revision < current_revision
  connection = ActiveRecord::Base.connection
  connection.execute "TRUNCATE revisions"
  connection.execute "TRUNCATE amiibo_ids"

  load(Rails.root.join("app", "seeds", "seed_content.rb"))
end
