module CategoryHelper

  def current_category
    if @category
      @category.name.capitalize
    else
      "All Categories"
    end
  end
end
