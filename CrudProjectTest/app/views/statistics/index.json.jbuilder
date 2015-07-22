json.array!(@statistics) do |statistic|
  json.extract! statistic, :id, :date, :logIn, :logOut
  json.url statistic_url(statistic, format: :json)
end
