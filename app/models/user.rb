class User < ApplicationRecord
    before_save { self.email = email.downcase }
    has_many :articles
    validates :username, presence: true,
                         uniqueness: { case_sensitive: false },
                         length: { minimum: 3, maximum: 20 }
    
    unless defined?(VALID_EMAIL_REGEX)
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    end
    
    validates :email, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { minimum: 5, maximum: 105 },
                      format: { with: VALID_EMAIL_REGEX }
    
    has_secure_password
  end
  