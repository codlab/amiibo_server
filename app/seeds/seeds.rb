current_revision = 3

if Revision.count == 0 or Revision.order("revision DESC ").first.revision < current_revision
  connection = ActiveRecord::Base.connection
  connection.execute "TRUNCATE revisions RESTART IDENTITY"
  connection.execute "TRUNCATE amiibo_ids RESTART IDENTITY"

  load(Rails.root.join("app", "seeds", "seed_content.rb"))
end
