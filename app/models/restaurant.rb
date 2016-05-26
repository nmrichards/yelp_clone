class Restaurant < ActiveRecord::Base
  has_many :reviews,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy
  belongs_to :user
  validates :name, length: { minimum: 3 }, uniqueness: true

  def created_by?(current_user)
    user == current_user
  end
end
