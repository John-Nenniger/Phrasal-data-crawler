json.array! @matches do |match|
  json.sentence @match.sentence
  json.url @match.article.url
end
