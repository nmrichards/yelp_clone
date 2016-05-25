describe Review, type: :model do
  it "has correct association with user and restaurant" do
    should belong_to :user
    should belong_to :restaurant
  end
  it "is invalid if the rating is more than 5" do
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end
end
