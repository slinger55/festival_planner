class WelcomeController < ApplicationController
  def index
    @acts = Act.all.order("time")
  end
end
