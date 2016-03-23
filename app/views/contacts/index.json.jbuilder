json.array!(@contacts) do |contact|
  json.extract! contact, :id, :nom, :prenom, :email
  json.url contact_url(contact, format: :json)
end
