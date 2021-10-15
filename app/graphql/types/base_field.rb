module Types
  class BaseField < GraphQL::Schema::Field
    # Override #initialize to take a new argument:
    def initialize(*args, require_logged_in: true, **kwargs, &block)
      @require_logged_in = require_logged_in
      # Pass on the default args:
      super(*args, **kwargs, &block)
    end

    def authorized?(obj, args, ctx)
      super && (@require_logged_in ? ctx[:current_user].present? : true)
    end
  end
end
