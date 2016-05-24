require 'spec_helper'

describe Restaurant, type: :model do

  it 'not valid with a name of less than 3 letters' do
    restaurant = Restaurant.new(name:"kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'not valid if restaurant is already added' do
    Restaurant.create(name: 'Papa Johns')
    restaurant = Restaurant.new(name: "Papa Johns")
    expect(restaurant).to have(1).error_on(:name)
  end

end
