class SearchController < ApplicationController
  def index
    @categories = Category.all
    @jobs = Job.where(["to_tsvector('english', title::text) @@ plainto_tsquery('english', ?) OR to_tsvector('english', location::text) @@ plainto_tsquery('english', ?)", params[:search_title], params[:search_location]])
  end
end
