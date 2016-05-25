
describe User, type: :model do
  it { is_expected.to have_many :reviewed_restaurants}
  # it { is_expected.to validate_uniqueness_of(:user).scoped_to(:restaurant) }
end