class Types::UserInputType < GraphQL::Schema::InputObject
  description "Attributes required for creating a User"

  argument :name, String, "Name of the User", required: true
end
