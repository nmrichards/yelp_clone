describe User, type: :model do
  it "has correct association with reviews and restaurants" do
    should have_many(:reviews)
    should have_many(:restaurants)
  end

  it { is_expected.to have_many :reviewed_restaurants}
end
