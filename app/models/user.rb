class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :login_activities, as: :user # use :user no matter what your model name
  has_and_belongs_to_many :guardings
  belongs_to :admin_user, optional: true

  def name
    email
  end
end
