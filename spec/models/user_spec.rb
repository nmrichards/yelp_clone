require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe User, type: :model do
    it "has correct association with reviews, restaurants" do
      should have_many(:reviews)
      should have_many(:restaurants)
    end
  end

end
