module Mutations
  class CreateTask < Mutations::BaseMutation
    argument :task, Types::Input::CreateTask, required: true

    field :task, Types::TaskType, null: true

    def resolve(task:)
      task_params = Hash task
      { task: Task.create!(task_params) }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
