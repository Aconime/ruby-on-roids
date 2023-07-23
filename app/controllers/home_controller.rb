class HomeController < ApplicationController
  def index
    @events = Event.last(3)
    @blogs = Blog.where(published: true).last(4)
  end
end
