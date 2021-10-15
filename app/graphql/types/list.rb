module Types
  class List < GraphQL::Schema::Object
    field :title, String, null: false
    field :id, ID, null: false
  end
end