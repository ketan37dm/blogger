Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :post do
    type types[Types::PostType]
    argument :id, !types.ID
    description "Find a post by ID"
    resolve -> (obj, args, context) {
      Post.where(id: args['id'])
    }
  end
end
