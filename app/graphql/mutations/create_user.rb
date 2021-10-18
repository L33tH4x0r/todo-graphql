module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :user, Types::Input::CreateUser, required: true

    field :user, Types::UserType, null: true, require_logged_in: false

    def resolve(user:)
      user_params = Hash user
      { user: User.create!(user_params) }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
