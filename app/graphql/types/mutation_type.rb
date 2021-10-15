module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser, require_logged_in: false,
      description: 'Creates a user with a user name and password'

    field :login_user, mutation: Mutations::LoginUser, require_logged_in: false,
      description: 'Logins in a user with a usernam or password'
    
    field :create_list, mutation: Mutations::CreateList,
      description: 'Creates a list for a logged in user'
  end
end
