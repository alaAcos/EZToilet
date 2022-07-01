if @review.persisted?
  json.form json.partial!("reviews/new.html.erb", toilet: @toilet, review: Review.new)
  json.inserted_item json.partial!("toilets/review.html.erb", review: @review)
else
  json.form json.partial!("reviews/new.html.erb", toilet: @toilet, review: @review)
end
