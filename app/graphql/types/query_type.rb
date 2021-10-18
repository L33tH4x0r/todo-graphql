module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :lists, [Types::ListType], null: true, description: 'Gets all lists for a user'
    field :list, Types::ListType, null: true, description: 'Gets list by id' do
      argument :list_id, ID, required: true
    end

    field :task, Types::TaskType, null: true, description: 'Gets task by id' do
      argument :task_id, ID, required: true
    end

    def list(list_id:)
      current_user.lists.find_by(id: list_id)
    end

    def task(task_id:)
      Task.user_owned(current_user).find_by(id: task_id)
    end

    def lists
      current_user.lists.includes(:tasks)
    end
  end
end
