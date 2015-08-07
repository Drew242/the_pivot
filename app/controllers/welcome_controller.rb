class WelcomeController < ApplicationController
  def index
    if Item.top.size >= 3
      @items = Item.top
    else
      @items = Item.all
    end
  end
end
