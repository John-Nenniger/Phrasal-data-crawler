# puts @contents.class.name
# puts @contents
json.array! @contents do |match|
  json.sentence match.sentence
  json.url match.article.url
end
