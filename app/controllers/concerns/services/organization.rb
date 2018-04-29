module Services
  module Organization
    extend ActiveSupport::Concern

    included do
      before_action :org_redirection_method, unless: :devise_controller?
    end

    # Redirect to organization creation page if one not created else to the welcome page.
    def org_redirection_method
      if org_present?
        redirect_to root_path if org_controller?
      else
        redirect_to new_organization_path unless org_controller?
      end
    end

    def org_controller?
      # Any action to organization controller should be prevented if one already created.
      controller_name == "organizations"
    end


    def org_present?(user=current_user)
      user.organization.present?
    end

  end
end