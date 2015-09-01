class SearchController < ApplicationController
  def index
    @categories = Category.all
    @jobs = Job.where(["to_tsvector('english', title::text) @@ to_tsquery('english', ?) OR to_tsvector('english', location::text) @@ to_tsquery('english', ?)", params[:search_title], params[:search_location]])
  end
end
