json.array!(@pages) do |page|
  json.extract! page, :id, :name, :body_html
  json.url page_url(page, format: :json)
end
