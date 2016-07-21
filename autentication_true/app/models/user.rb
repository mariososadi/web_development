class User < ActiveRecord::Base
  include BCrypt

  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password_digest, :presence => true

  #Son necesarios ambos métodos para que BCrypt funcione.
  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end
  
  #Este es el método de autenticación para que funcione BCrypt
  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
    if user && (user.password == user_password)
      return user
    else
      false
    end
  end


end

