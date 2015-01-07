class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :uniqueness => {
    :case_sensitive => false }, presence: true, length: { minimum: 3, maximum: 18,
    too_long: "Your username must contain between 3 and 18 characters" }


  attr_accessor :login

  has_many :likes
  has_many :posts
  has_many :comments

  def self.find_for_database_authentication(warden_conditions)
   	conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
