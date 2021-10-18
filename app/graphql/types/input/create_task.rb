module Types
  module Input
    class CreateTask < Types::BaseInputObject
      argument :list_id, ID, required: true
      argument :description, String,
               required: true,
               description: 'The text that will be describe what the task tracks'
      argument :completed, Boolean,
               required: false,
               description: 'Shortcut to set if the task is completed or not'
      argument :type, String,
               required: false,
               description: 'Sets the type of the task to get more validations. Must be one of [TextTask, CounterTask, TimedTask]'
  
      # CounterTask Params
      argument :count, Integer,
               required: false,
               description: 'A field to count the number of times a task was completed. Used with the CounterTask.'
  
      # TimedTask Params
      argument :starts_at, String,
               required: false,
               description: 'A field to track when the task starts. Used with the TimedTask.'
      argument :ends_at, String,
               required: false,
               description: 'A field to track when the task ends. Used with the TimedTask.'
    end
  end
end