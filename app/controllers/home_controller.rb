class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.verified == false
      redirect_to pins_path
    end
  end
end
