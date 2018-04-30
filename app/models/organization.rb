class Organization < ApplicationRecord
  include Validations::Organization
  belongs_to :user
end
