class PinController < ApplicationController
  before_action :authenticate_user!
  def index
    
  end

  # def create
  #   @phone = PhoneNumber.find_or_create_by(phone: params[:phone][:phone])
  #   @phone.generate_pin
  #   @phone.pin
  #   respond_to do |format|
  #     format.js # render app/views/phones/create.js.erb
  #   end
  # end
end