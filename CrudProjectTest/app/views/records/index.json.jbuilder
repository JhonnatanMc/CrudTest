json.array!(@records) do |record|
  json.extract! record, :id, :recordTitle, :recordDescription, :startDate, :endDate, :endPresent, :recordPrivacity, :userId, :location, :isApproxStartDate, :isApproxEndDate
  json.url record_url(record, format: :json)
end
