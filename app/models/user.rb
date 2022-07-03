class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  def name
    if self.first_name && self.last_name
      return "#{first_name} #{last_name}"
    elsif 
      self.first_name && self.last_name == nil
      return first_name
    else
      return email
    end
  end
end
