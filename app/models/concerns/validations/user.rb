module Validations
  module User
    extend ActiveSupport::Concern

    included do
      validates :email, presence: true, uniqueness: true
    end
  end
end