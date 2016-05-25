class Restaurant < ActiveRecord::Base
<<<<<<< HEAD
=======
   has_many :reviews
   validates :name, length: { minimum: 3 }, uniqueness: true
>>>>>>> day-two
end
