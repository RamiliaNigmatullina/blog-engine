class User
  class ParameterSanitizer < Devise::ParameterSanitizer
    USER_PARAMS = %i(
      full_name
      email
      username
      password
      password_confirmation
    ).freeze

    def sign_up
      default_params.permit(USER_PARAMS)
    end

    def account_update
      default_params.permit(USER_PARAMS, :profile_image)
    end
  end
end
