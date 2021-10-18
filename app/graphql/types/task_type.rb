module Types
  class TaskType < GraphQL::Schema::Object
    field :id, ID,
          null: false
    field :description, String,
          null: true,
          description: 'The text that will be describe what the task tracks'
    field :completed, Boolean,
          null: true,
          description: 'Shortcut to set if the task is completed or not'
    field :type, String,
          null: true,
          description: 'Sets the type of the task to get more validations. Must be one of [TextTask, CounterTask, TimedTask]'

    # CounterTask Params
    field :count, Integer,
          null: true,
          description: 'A field to count the number of times a task was completed. Used with the CounterTask.'

    # TimedTask Params
    field :starts_at, String,
          null: true,
          description: 'A field to track when the task starts. Used with the TimedTask.'
    field :ends_at, String,
          null: true,
          description: 'A field to track when the task ends. Used with the TimedTask.'
    field :list, Types::ListType, null: true
  end
end