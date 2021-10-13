module Types
  class User < GraphQL::Schema::Object
      field :email, String, null: true
      field :username, String, null: true
  end
end