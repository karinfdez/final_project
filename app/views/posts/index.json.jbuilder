json.array!(@posts) do |post|
  json.extract! post, :id, :title, :image, :user_id, :author, :content
  json.url post_url(post, format: :json)
end
