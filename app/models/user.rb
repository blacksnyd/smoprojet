class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :login_activities, as: :user # use :user no matter what your model name
  has_and_belongs_to_many :guardings
  belongs_to :admin_user, optional: true

  def within_one_km_of_guarding?(guarding)
    user_coordinates = [
      self.login_activities.each do |item|
        item.latitude
        item.longitude
      end
    ]
    guarding_coordinates = [guarding.latitude, guarding.longitude]

    distance = Geocoder::Calculations.distance_between(user_coordinates, guarding_coordinates)

    distance * 1000 <= 1000 # Check if the distance is less than or equal to 1 km
  end

  def name
    email
  end
end
