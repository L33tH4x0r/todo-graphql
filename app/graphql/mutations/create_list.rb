module Mutations
  class CreateList < Mutations::BaseMutation
    argument :list, Types::Input::CreateList, required: true

    field :list, Types::List, null: true

    def resolve(list:)
      list_params = Hash list
      { list: List.create!(list_params.merge(user: context[:current_user])) }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
