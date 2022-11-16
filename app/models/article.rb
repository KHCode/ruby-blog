class Article < ApplicationRecord
  include Visible
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_rich_text :body
  has_many_attached :photos
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
