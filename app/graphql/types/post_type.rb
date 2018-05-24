Types::PostType = GraphQL::ObjectType.define do
  name "Post"
  description "A blog post"

  field :id, !types.ID
  field :content, !types.String
  field :user_id, !types.Int
  field :comments, !types[Types::CommentType]
end
