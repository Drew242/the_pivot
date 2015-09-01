class SearchController < ApplicationController
  def index
    @categories = Category.all
    if has_content?(params[:search_title]) && has_content?(params[:search_location])
      @jobs = Job.where(["to_tsvector('english', title::text) @@ plainto_tsquery('english', ?) AND to_tsvector('english', location::text) @@ plainto_tsquery('english', ?)", params[:search_title], params[:search_location]])
    elsif has_content?(params[:search_title])
      @jobs = Job.where(["to_tsvector('english', title::text) @@ plainto_tsquery('english', ?)", params[:search_title]])
    elsif has_content?(params[:search_location])
      @jobs = Job.where(["to_tsvector('english', location::text) @@ plainto_tsquery('english', ?)", params[:search_location]])
    else
      redirect_to root_path
    end
  end

  private

  def has_content?(parameter)
    true unless parameter.empty?
  end
end
