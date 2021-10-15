module Types
  class User < GraphQL::Schema::Object
    field :id, ID, null: false
    field :email, String, null: false
    field :username, String, null: false
  end
end