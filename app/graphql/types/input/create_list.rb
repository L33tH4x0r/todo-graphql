module Types
  module Input
    class CreateList < Types::BaseInputObject
      argument :title, String, required: true
    end
  end
end