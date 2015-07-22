json.array!(@categories) do |category|
  json.extract! category, :id, :categoryTitle, :categoryColor, :userId
  json.url category_url(category, format: :json)
end
