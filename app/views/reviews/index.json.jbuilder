json.array!(@reviews) do |review|
  json.extract! review, :id, :uid, :score
  json.url review_url(review, format: :json)
end
