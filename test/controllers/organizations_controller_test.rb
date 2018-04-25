require 'test_helper'

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:one)
  end

  test "should get index" do
    get organizations_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_url
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post organizations_url, params: { organization: { addr_line1: @organization.addr_line1, addr_line2: @organization.addr_line2, city: @organization.city, country: @organization.country, first_name: @organization.first_name, last_name: @organization.last_name, org_identifier: @organization.org_identifier, org_name: @organization.org_name, state: @organization.state, user_id: @organization.user_id, zipcode: @organization.zipcode } }
    end

    assert_redirected_to organization_url(Organization.last)
  end

  test "should show organization" do
    get organization_url(@organization)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_url(@organization)
    assert_response :success
  end

  test "should update organization" do
    patch organization_url(@organization), params: { organization: { addr_line1: @organization.addr_line1, addr_line2: @organization.addr_line2, city: @organization.city, country: @organization.country, first_name: @organization.first_name, last_name: @organization.last_name, org_identifier: @organization.org_identifier, org_name: @organization.org_name, state: @organization.state, user_id: @organization.user_id, zipcode: @organization.zipcode } }
    assert_redirected_to organization_url(@organization)
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete organization_url(@organization)
    end

    assert_redirected_to organizations_url
  end
end
