class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :predictions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         validates :phone, uniqueness: true

         def email_required?
          false
         end
         
         def email_changed?
          false
         end

        def get_points_sum
          self.predictions.sum(:points)
        end
end
