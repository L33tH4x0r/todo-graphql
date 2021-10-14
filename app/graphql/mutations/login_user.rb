module Mutations
  class LoginUser < Mutations::BaseMutation
    argument :login, Types::Input::Login, required: true

    field :user, Types::User, null: true

    def resolve(login:)
      login_params = Hash login
      user = User.where(username: login_params[:username]).or(User.where(email: login_params[:username])).first
      if user&.authenticate(login_params[:password])
        { user: user }
      else
        GraphQL::ExecutionError.new('Invalid username or password')
      end
    end
  end
end