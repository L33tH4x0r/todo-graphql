module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser,
      description: 'Creates a user with a user name and password'

    field :login_user, mutation: Mutations::LoginUser,
      description: 'Logins in a user with a usernam or password'
  end
end
