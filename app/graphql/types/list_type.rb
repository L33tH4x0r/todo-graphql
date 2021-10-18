module Types
  class ListType < GraphQL::Schema::Object
    field :title, String, null: false
    field :id, ID, null: false
    field :tasks, [Types::TaskType], null: true
  end
end