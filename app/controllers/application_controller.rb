class ApplicationController < ActionController::Base

  skip_before_action :verify_authenticity_token


  include ActionController::MimeResponds

  def authenticate

    authenticate_or_request_with_http_token do |token, options|

      aouth_token = Token.unscoped.find_by(code: token)
      if aouth_token.expired?
        return render json: {
          message: "Unauthorized access in the API"
        }, status: 401
      end
      crypt = ActiveSupport::MessageEncryptor.new(aouth_token.key)                           # => #<ActiveSupport::MessageEncryptor ...>
      token_dy = crypt.decrypt_and_verify(aouth_token.code)
      @merchant = aouth_token.merchant
      aouth_token.token == token_dy
    end
  end
end
