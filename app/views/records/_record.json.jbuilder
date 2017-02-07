json.extract! record, :id, :text, :number, :created_at, :updated_at
json.url record_url(record, format: :json)