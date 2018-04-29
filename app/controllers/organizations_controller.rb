class OrganizationsController < ApplicationController
  layout 'postlogin'

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

  def unique_org_name_check
    respond_to do | format |
      format.json { render json: is_org_unique?(params["organization"]["org_name"])}
    end
  end

  private

    def is_org_unique?(org_name)
      Organization.find_by(org_name: org_name).blank?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:org_name, :org_identifier, :first_name, :last_name, :addr_line1, :addr_line2, :city, :state, :country, :zipcode, :user_id)
    end
end
