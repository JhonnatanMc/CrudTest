json.array!(@media) do |medium|
  json.extract! medium, :id, :mediaPath, :mediaComment, :date
  json.url medium_url(medium, format: :json)
end
