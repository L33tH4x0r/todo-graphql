module Types
  module Input
    class Login < Types::BaseInputObject
      argument :username, String, required: true
      argument :password, String, required: true
    end
  end
end