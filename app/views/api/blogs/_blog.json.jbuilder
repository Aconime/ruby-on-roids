json.extract! blog, :id, :created_at, :updated_at
json.url api_blog_url(blog, format: :json)
