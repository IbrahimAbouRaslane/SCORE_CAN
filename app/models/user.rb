class User < ApplicationRecord
  require 'twilio-ruby'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:phone]
  after_commit :send_message, on: :create

         validates :phone, uniqueness: true 
         validates :email, uniqueness: false
         def email_required?
          false
         end
         
         def email_changed?
          false
         end


         private
         def send_message
          @account_sid = 'AC8c8c80d3c284ad23ecc759a02733c597'
          @api_key_sid = 'ed826fbb683998357e8c0e95b22ea133'
          @phone_sid = 'MG9110076d99890f2d6ed14ff273f2fa64'
          @user = Twilio::REST::Client.new(@account_sid, @api_key_sid)
          @user.messages.create(
            body:self.pin,
            messaging_service_sid: @phone_sid, 
            to:self.phone
          )
         end

end
