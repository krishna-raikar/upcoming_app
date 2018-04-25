class OrganizationsController < ApplicationController

  before_action :authenticate_user!

  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = current_user.build_organization(organization_params)
    respond_to do |format|
      if @organization.save
        format.html { redirect_to root_path, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:org_name, :org_identifier, :first_name, :last_name, :addr_line1, :addr_line2, :city, :state, :country, :zipcode, :user_id)
    end
end
