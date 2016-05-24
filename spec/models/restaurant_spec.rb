require 'spec_helper'

describe Restaurant, type: :model do

  it 'not valid with a name of less than 3 letters' do
    restaurant = Restaurant.new(name:"kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

end