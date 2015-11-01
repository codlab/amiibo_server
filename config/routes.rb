Amiibo::Application.routes.draw do
  match 'amiibos' => 'amiibo_id#list'
end
