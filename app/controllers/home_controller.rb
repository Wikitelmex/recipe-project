class HomeController < ApplicationController
  before_action :authenticate_user!
  after_action { print "after action message" }

  def index; end
end
