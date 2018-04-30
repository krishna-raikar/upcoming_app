require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test "Create Organization without org name" do
    org = Organization.create
    assert_not org.valid?
  end
end
