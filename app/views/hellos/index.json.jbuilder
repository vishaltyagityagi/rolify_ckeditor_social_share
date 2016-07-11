json.array!(@hellos) do |hello|
  json.extract! hello, :id, :name
  json.url hello_url(hello, format: :json)
end
