Types::UserType = GraphQL::ObjectType.define do
  name "User"
  description "A user"
  implements GraphQL::Relay::Node.interface
  global_id_field :id

  field :name, !types.String
  connection :posts, Types::PostType.connection_type
  connection :comments, Types::CommentType.connection_type
end
