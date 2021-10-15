module Types
  class List < GraphQL::Schema::Object
    field :title, String, null: false
    field :id, ID, null: false

    def self.scoped_items(items, _context)
      items.where(id: current_user.lists.pluck(:id))
    end
  end
end