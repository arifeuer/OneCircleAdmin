json.array!(@forms) do |form|
  json.extract! form, :id, :type
  json.url form_url(form, format: :json)
end
