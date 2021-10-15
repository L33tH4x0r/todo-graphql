module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :lists, [Types::List], null: false, description: 'Gets all lists for a user'
    field :list, Types::List, null: false, description: 'Gets list by id' do
      argument :list_id, ID, required: true
    end

    def list(list_id:)
      current_user.lists.find_by(id: list_id)
    end
  end
end
