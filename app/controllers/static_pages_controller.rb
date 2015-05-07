class StaticPagesController < ApplicationController
  def index
    @recipes=Recipe.where('publish_date <= ?', Time.now).reorder(:publish_date).last
  end

  def about
  end

  def archive
    @recipes=Recipe.order(:name)
  end

end
