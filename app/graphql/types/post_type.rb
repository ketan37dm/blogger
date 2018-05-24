Types::PostType = GraphQL::ObjectType.define do
  name "Post"
  description "A blog post"
  implements GraphQL::Relay::Node.interface
  global_id_field :id

  field :content, !types.String
  field :user_id, !types.Int

  connection :comments, Types::CommentType.connection_type
end
