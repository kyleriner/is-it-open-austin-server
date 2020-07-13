class User < ApplicationRecord
    has_many :places
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end