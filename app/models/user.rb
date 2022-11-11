class User < ApplicationRecord
  has_secure_password
  has_many :articles, dependent :nullify
  has_many :comments, dependent :nullify
  validates_uniqueness_of :email
end
