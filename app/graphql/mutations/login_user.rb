module Mutations
  class LoginUser < Mutations::BaseMutation
    argument :login, Types::Input::Login, required: true

    field :user, Types::UserType, null: true, require_logged_in: false
    field :token, String, null: true, require_logged_in: false

    def resolve(login:)
      login_params = Hash login
      user = User.where(username: login_params[:username]).or(User.where(email: login_params[:username])).first
      if user&.authenticate(login_params[:password])
        secret = Rails.application.credentials.jwt_secret_key
        token = JWT.encode({ user_id: user.id, expires_at: 1.hour.from_now }, secret, 'HS256')

        { user: user, token: token }
      else
        GraphQL::ExecutionError.new('Invalid username or password')
      end
    end
  end
end