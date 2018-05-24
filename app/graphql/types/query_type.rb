Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.
  field :node, GraphQL::Relay::Node.field
  field :nodes, GraphQL::Relay::Node.plural_field

  field :user do
    type Types::UserType
    description "User"
    argument :id, !types.ID
    resolve -> (object, args, context) {
      User.find_by(id: args['id'])
    }
  end

  connection :users, Types::UserType.connection_type do
    description "A collection of users"
    resolve ->(object, args, context) {
      User.all
    }
  end

  field :post do
    type Types::PostType
    description "Find a post by ID"
    argument :id, !types.ID
    resolve -> (obj, args, context) {
      Post.find_by(id: args['id'])
    }
  end

  connection :posts, Types::PostType.connection_type do
    description "Collection of posts"
    resolve -> (obj, args, context) {
      Post.all
    }
  end

end
