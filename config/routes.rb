Amiibo::Application.routes.draw do
  match 'amiibos' => 'amiibo_id#list'
  post 'encrypt' => 'api#encrypt'
  post 'decrypt' => 'api#decrypt'
end
