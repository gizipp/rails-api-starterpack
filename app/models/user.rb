class User < ApplicationRecord
    # encrypt password
    has_secure_password

    # Model associations
    has_many :prayers
    # Validations
    validates_presence_of :name, :password_digest

    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :username, presence: true, uniqueness: { case_sensitive: false }

    validates_numericality_of :prayer_count, :not_prayer_count, only_integer: true, greater_than_or_equal_to: 0

    before_save :downcase_some_columns

    def downcase_some_columns
      self.email    = email.downcase
      self.username = username.downcase
    end

    def auth_token
      JsonWebToken.encode(user_id: id)
    end
end
