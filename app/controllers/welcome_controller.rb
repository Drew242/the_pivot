class WelcomeController < ApplicationController
  def index
    @items = RandomItemsGenerator.generate(Item.all)
  end
end
