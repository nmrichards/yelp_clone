class Restaurant < ActiveRecord::Base

  has_many :restaurants
  has_many :reviews

  validates :name, length: { minimum: 3 }, uniqueness: true
end
