class User < ActiveRecord::Base
	acts_as_authentic do |a|
    a.validate_login_field = true
    a.validate_password_field = true
    a.require_password_confirmation = true
    a.logged_in_timeout = 5.minutes # default is 10.minutes
    # for using default encryption system (SCrypt) also install 'scrypt' gem
    a.crypto_provider = Authlogic::CryptoProviders::Sha512
end

validates_presence_of :name, :login, :email, :password, :password_confirmation
  validates_length_of :name, :in => 3..225
  validates_uniqueness_of :name, :login, :email
end