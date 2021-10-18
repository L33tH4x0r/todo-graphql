module Types
  class UserType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :email, String, null: false
    field :username, String, null: false
    field :lists, [Types::ListType], null: false
  end
end