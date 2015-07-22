json.array!(@records) do |record|
  json.extract! record, :id, :recordTitle, :recordDescription, :startDate, :endDate, :endPresent, :recordPrivacity, :userId, :location
  json.url record_url(record, format: :json)
end
