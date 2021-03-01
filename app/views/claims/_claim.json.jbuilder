json.extract! claim, :id, :claim_name, :amount, :claim_date, :created_at, :updated_at
json.url claim_url(claim, format: :json)
