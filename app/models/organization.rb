class Organization < ApplicationRecord
  belongs_to :user

  validates :org_name, presence: true, length: { maximum: 50 }
  validates :org_identifier, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9_]+\z/ }
  validates :first_name, presence: true, length: {minimum: 2, maximum: 50}
  validates :last_name, presence: true, length: {minimum: 2, maximum: 50}
  validates :addr_line1, presence: true, length: {minimum: 2, maximum: 100}
  validates :addr_line2, length: {maximum: 100}
  validates :city, presence: true, length: {minimum: 2, maximum: 35}
  validates :state, length: { maximum: 50 }
  validates :country, presence: true, length: { maximum: 90 }
  validates :zipcode, presence: true, length: { is: 6 }



  def created_by
    first_name + " " + last_name
  end

end
