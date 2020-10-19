class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable
  paginates_per 10

  validates :email, :name, :lastname, :patronymic, :phone, :address, presence: true

end
