json.array!(@reports) do |report|
  json.extract! report, :id, :status, :reason
  json.url report_url(report, format: :json)
end
